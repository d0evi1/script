
#-------------------------------------
# libevent      junle   2014.8.1
#------------------------------------
LIBEVENT_PATH=/usr/local/libevent
LIBEVENT_BIN=${LIBEVENT_PATH}/bin


#-------------------------------------
# go             junle   2014.8.15
#-------------------------------------
export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/workspace/go_proj

#--------------------------------------
# beanstalk      junle   2014.9.15
#--------------------------------------
export BEANSTALK_ROOT=/usr/local/beanstalk
export BEANSTALK_BIN=$BEANSTALK_ROOT/bin
export BEANSTALK_LIB=$BEANSTALK_ROOT/lib

#--------------------------------------
# hadoop        junle   2014.9.22
#--------------------------------------
#export HADOOP_HOME=/usr/local/hadoop/hadoop-2.5.1
export HADOOP_HOME=/usr/local/hadoop/hadoop-2.2.0

export HADOOP_BIN=$HADOOP_HOME/bin
export HADOOP_PREFIX=${HADOOP_HOME}
export HADOOP_COMMON_HOME=${HADOOP_PREFIX}
export HADOOP_HDFS_HOME=${HADOOP_PREFIX}
export HADOOP_MAPRED_HOME=${HADOOP_PREFIX}
export HADOOP_YARN_HOME=${HADOOP_PREFIX}
export HADOOP_CONF_DIR=$HADOOP_PREFIX/etc/hadoop
export YARN_CONF_DIR=${HADOOP_CONF_DIR}

### mac.
#export HADOOP_OPTS="$HADOOP_OPTS -Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"


#-------------------------------------
# mahout config.
#-------------------------------------
export MAHOUT_LOCAL=/usr/local/mahout
export MAHOUT_HOME=/usr/local/mahout
export MAHOUT_BIN=$MAHOUT_HOME/bin

#--------------------------------------
# hive config.
#--------------------------------------
export HIVE_HOME=/usr/local/hive
export HIVE_BIN=$HIVE_HOME/bin

#--------------------------------------
#
#--------------------------------------
export SCRAPY_PATH=/Library/Python/2.7/site-packages/Scrapy-0.24.1-py2.7.egg/scrapy



#--------------------------------------
# homebrew
#-------------------------------------
export HOMEBREW_GITHUB_API_TOKEN=3f63fbb67565e817547e6798bfa758e5cd7af5e6

#--------------------------------------
# ruby 
#--------------------------------------
export RUBY_HOME=/usr/local/Cellar/ruby/2.1.3
export RI="--format ansi --width 70"
export RUBY_BIN=$RUBY_HOME/bin

#--------------------------------------
# scala
#--------------------------------------
#export SCALA_HOME=/usr/local/scala/scala-2.10.4
export SCALA_HOME=/usr/local/scala/scala-2.11.7

export SCALA_BIN=${SCALA_HOME}/bin

#--------------------------------------
#
#--------------------------------------
#export SPARK_HOME=/usr/local/spark/spark-1.0.2-bin-hadoop2
export SPARK_HOME=/usr/local/spark/spark-1.5.1-bin-hadoop2.4
export SPARK_BIN=${SPARK_HOME}/bin

#-------------------------------------
# java 
#-------------------------------------
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home
export JAVA_BIN=$JAVA_HOME/bin
export JAVA_LIB=${JAVA_HOME}/jre/lib/server/


#------------------------------------
# xampp
#------------------------------------
export XAMPP_HOME=/Applications/XAMPP/xamppfiles


#-----------------------------------
#
#-----------------------------------
export ECLIPSE_PROJ=

#-----------------------------------
# gensim pyro
#-----------------------------------
export PYRO_SERIALIZERS_ACCEPTED=pickle
export PYRO_SERIALIZER=pickle


#------------------------------------
# crf++
#-----------------------------------
export CRFPP_HOME=/usr/local/crf++
export CRFPP_BIN=${CRFPP_HOME}/bin
export CRFPP_LIB=${CRFPP_HOME}/lib


#-----------------------------------
# maxent 
#------------------------------------
export MAXENT_HOME=/usr/local/nlp/maxent
export MAXENT_BIN=$MAXENT_HOME/bin
export MAXENT_LIB=$MAXENT_HOME/lib


#------------------------------------
# gcc5
#-------------------------------------
export GCC_HOME=/usr/local/Cellar/gcc/5.3.0
export GCC_BIN=${GCC_HOME}/bin
export GCC_LIB=${GCC_HOME}/lib


#-------------------------------------
#
#------------------------------------
export MECAB_HOME=/usr/local/nlp/mecab
export MECAB_BIN=${MECAB_HOME}/bin
export MECAB_LIB=${MECAB_LIB}/lib


export OCTAVE_BIN=/Applications/Octave-cli.app/Contents/MacOS/
#/Applications/Octave-gui.app/Contents/MacOS


##------------------------
#
#-------------------------
export OPENMPI_BIN=/usr/local/Cellar/open-mpi/2.0.1/bin/
export OPENMPI_LIB=/usr/local/Cellar/open-mpi/2.0.1/lib/

#-------------------------
# opencv2.
#-------------------------
export OPENCV2_HOME=/usr/local/opencv/
export OPENCV2_BIN=${OPENCV2_HOME}/bin
export OPENCV2_LIB=${OPENCV2_HOME}/lib


#--------------------------------------
# PATH and LD_LIB
#--------------------------------------
export PATH=$PATH:/usr/local/bin/scrapy:/usr/local/go/bin:/usr/local/nutcracker/sbin:$BEANSTALK_BIN:$HADOOP_BIN:$MAHOUT_BIN:$GO_BIN:$RUBY_BIN:$HIVE_BIN:$JAVA_BIN:$SCALA_BIN:$SPARK_BIN:$CRFPP_BIN:$MAXENT_BIN:$MECAB_BIN:$OCTAVE_BIN:$OPENMPI_BIN:$GCC_BIN:$OPENCV2_BIN

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BEANSTALK_LIB:$JAVA_LIB:$CRFPP_LIB:$MAXENT_LIB:$MECAB_LIB:$OPENMPI_LIB:$GCC_LIB:$OPENCV2_LIB
export LIBRARY_PATH=$LIBRARY_PATH:$BEANSTALK_LIB:$CRFPP_LIB:$MAXENT_LIB:$MECAB_LIB:$GCC_LIB:$OPENCV2_LIB

#export DOCKER_HOST=tcp://127.0.0.1:4243
