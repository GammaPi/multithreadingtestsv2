#!/bin/bash
  source ../home_var.sh

  set -x
  config_vars=Makefile

  if [ $# == 1 ]; then
    config_vars=$config_vars.$1
  fi

  if [ ! -f $config_vars ]; then
    echo "$config_vars does not exists" 
    exit 1
  fi

  rm -rf memcached-1.4.25
  tar xvf memcached-1.4.25.tar
  cd memcached-1.4.25/
  ./configure --prefix=$home/memcached/memcached-1.4.25/install --enable-61bit --with-libevent=$home/memcached/libevent-2.1.8-stable/install/
  
  cp ../$config_vars ./Makefile
  make
  make install
