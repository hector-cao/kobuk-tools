#!/usr/bin/env python3

import click
import subprocess
import os
from click_params import IP_ADDRESS
import paramiko

PKEY_PASSWORD = os.environ.get('PKEY_PASSWORD')

def connect(server):
    special_account = "ubuntu"
    pkey = paramiko.RSAKey.from_private_key_file("/home/hector/.ssh/id_rsa", PKEY_PASSWORD)
    client = paramiko.SSHClient()
    policy = paramiko.AutoAddPolicy()
    client.set_missing_host_key_policy(policy)
    client.connect(hostname=server, username=special_account, pkey=pkey)
    return client

@click.command()
@click.option('-i', '--ip-address', type=IP_ADDRESS)
def main(ip_address):
    click.echo(f'Your ip address is {ip_address}')
    client = connect(f'{ip_address}')
    ftp_client=client.open_sftp()
    ftp_client.put('{}/setup-tdx.sh'.format(os.getcwd()), '/tmp/setup-tdx.sh')
    ftp_client.close()
    _, stdout, _ = client.exec_command('chmod a+x /tmp/setup-tdx.sh && /tmp/setup-tdx.sh')
    for l in stdout.readlines():
        print(l)

if __name__ == '__main__':
  main()
