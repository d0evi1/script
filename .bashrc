
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
export HADOOP_HOME=/usr/local/hadoop
export HADOOP_BIN=$HADOOP_HOME/bin
export HADOOP_PREFIX=${HADOOP_HOME}
export HADOOP_COMMON_HOME=${HADOOP_PREFIX}
export HADOOP_HDFS_HOME=${HADOOP_PREFIX}
export HADOOP_MAPRED_HOME=${HADOOP_PREFIX}
export HADOOP_YARN_HOME=${HADOOP_PREFIX}
export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop/"
export YARN_CONF_DIR=${HADOOP_CONF_DIR}

#-------------------------------------
# mahout config.
#-------------------------------------
export MAHOUT_LOCAL=/usr/local/mahout
export MAHOUT_HOME=/usr/local/mahout
export MAHOUT_BIN=$MAHOUT_HOME/bin


#-------------------------------------
# java 
#-------------------------------------
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_BIN=$JAVA_HOME/bin



#--------------------------------------
# PATH and LD_LIB
#--------------------------------------
export PATH=$PATH:/usr/local/go/bin:/usr/local/nutcracker/sbin:$BEANSTALK_BIN:$HADOOP_BIN:$MAHOUT_BIN:$GO_BIN

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$BEANSTALK_LIB
export LIBRARY_PATH=$LIBRARY_PATH:$BEANSTALK_LIB

export C_INCLUDE_PATH=
