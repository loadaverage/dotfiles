#/usr/bin/env python3
from base64 import b64encode
from os import urandom
import argparse
import subprocess

def rand(length=18):
  _MIN_BYTES = 5
  _MAX_BYTES = 200

  parser = argparse.ArgumentParser(description='Get random data from\
          /dev/urandom, returns base64 encoded string')

  parser.add_argument('-b', type=int,
          help='amount of bytes from random generator, default is 18,\
          values < {0} and > {1} will be ignored '.format(_MIN_BYTES, _MAX_BYTES),
        metavar='{0}..{1}'.format(_MIN_BYTES, _MAX_BYTES),
        dest='bytes')

  parser.add_argument('-c', help='copy result to the clipboard',
        action='store_true', dest='copy')

  args = parser.parse_args()

  if type(args.bytes) is int and _MAX_BYTES >= args.bytes >= _MIN_BYTES:
    length = args.bytes

  r_bytes = urandom(length)
  r_b64 = b64encode(r_bytes).decode('UTF-8')

  if args.copy is True:
    subprocess.Popen(['pbcopy'], stdin = subprocess.PIPE,
         stdout = subprocess.PIPE,
         encoding='UTF-8').communicate(r_b64)

  return r_b64

print(rand())
