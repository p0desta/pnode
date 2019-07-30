FROM nickistre/ubuntu-lamp

COPY pnode.sql /pnode.sql
COPY pnode/ /var/www/html/
COPY dns.py /dns.py
COPY start.sh /start.sh

COPY sources.list /etc/apt/sources.list


# 进行更新
RUN apt-get update


#安装python及必须组件
RUN apt-get install -y python2.7 \
    && apt-get install -y python-pip \
    && apt-get install -y portaudio19-dev python-all-dev \
    && apt-get install -y libmysqlclient-dev \
    && apt-get install -y chromium-browser \
    && apt-get install -y xvfb
RUN pip install MySQL-python -i http://pypi.douban.com/simple/ \
    && pip install --upgrade urllib3 -i http://pypi.douban.com/simple/ \
    && pip install twisted -i http://pypi.douban.com/simple/
    
#启动修改mysql
RUN chown -R mysql.mysql /var/lib/mysql \
    && find /var/lib/mysql -type f -exec touch {} \; && service mysql start \
    && mysqladmin -uroot password '6df2dbfdaa94a9b357a8eeb0d7fddae5' \
    && mysql -e "CREATE DATABASE pnode DEFAULT CHARACTER SET utf8;" -uroot -p6df2dbfdaa94a9b357a8eeb0d7fddae5 \
    && mysql -e "use pnode;source /pnode.sql;" -uroot -p6df2dbfdaa94a9b357a8eeb0d7fddae5 \
    && rm /pnode.sql

#配置环境   
RUN rm /var/www/html/index.html \
    && rm /var/www/html/phpinfo.php \
    && sed -i "154s/Indexes//" /etc/apache2/apache2.conf \
    && sed -i "165s/Indexes//" /etc/apache2/apache2.conf \
    && service apache2 restart \
    && chown root:root -R /var/www/html/ \
    && chmod -R 655 /var/www/html/ \
    && chmod +t -R /var/www/html/ \
    && chmod a+x /start.sh

EXPOSE 80
EXPOSE 53
CMD ["/start.sh"]
