#coding=utf-8
import MySQLdb
from twisted.internet import reactor, defer
from twisted.names import client, dns, error, server

record = {}
class DynamicResolver(object):

    def _doDynamicResponse(self, query):
        name = query.name.name
        dns_rebind = ''
        ttl = 10
        if ".xnode.ga" in name:
            con = MySQLdb.connect(host='127.0.0.1', port=3306, user='root', passwd='p0desta_mysql', db='pnode')
            cursor = con.cursor()
            sql = "select dnsrebind from users where username='admin'"
            cursor.execute(sql)
            dns_rebind = cursor.fetchall()[0][0]
            sql = "insert into dnslogs(log) value('{0}')".format(name)
            cursor.execute(sql)
            con.commit()
            cursor.close()
        print dns_rebind
        if name not in record or dns_rebind == '':
            record[name] = 0
    
        if record[name] > 0 and name in record:
            ip = dns_rebind
            ttl = 0
        else:
            ip="114.116.44.126"    
 
        if dns_rebind != '':
            record[name] += 1
        
        print name+" ===> "+ip

        answer = dns.RRHeader(
            name=name,
            type=dns.A,
            cls=dns.IN,
            ttl=ttl,
            payload=dns.Record_A(address=b'%s'%ip,ttl=ttl)
        )
        answers = [answer]
        authority = []
        additional = []
        return answers, authority, additional

    def query(self, query, timeout=None):
        return defer.succeed(self._doDynamicResponse(query))

def main():
    factory = server.DNSServerFactory(
        clients=[DynamicResolver(), client.Resolver(resolv='/etc/resolv.conf')]
    )

    protocol = dns.DNSDatagramProtocol(controller=factory)
    reactor.listenUDP(53, protocol)
    reactor.run()

if __name__ == '__main__':
    raise SystemExit(main())

