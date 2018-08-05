### 准备证书工具程序
echo "准备证书工具程序..."
if [ -f "cfssl_linux-amd64" ]; then
  mv -f cfssl_linux-amd64 ../bin/cfssl
else
  echo 请先下载https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
fi
if [ -f "cfssljson_linux-amd64" ]; then
  mv -f cfssljson_linux-amd64 ../bin/cfssljson
else
  echo 请先下载https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
fi
if [ -f "cfssl-certinfo_linux-amd64" ]; then
  mv -f cfssl-certinfo_linux-amd64 ../bin/cfssl-certinfo
else
  echo 请先下载https://pkg.cfssl.org/R1.2/cfssl-certinfo_linux-amd64
fi

### 准备etcd程序
echo "准备etcd二进制程序..."
if [ -f "etcd-v3.3.9-linux-amd64.tar.gz" ]; then
  echo "extracting etcd binaries..."
  tar zxf etcd-v3.3.9-linux-amd64.tar.gz
  mv -f etcd-v3.3.9-linux-amd64/etcd* ../bin
else
  echo 请先下载etcd-v3.3.9}-linux-amd64.tar.gz
fi

### 准备kubernetes程序
echo "准备kubernetes二进制程序..."
if [ -f "kubernetes-server-linux-amd64.tar.gz" ]; then
  echo "extracting kubernetes binaries..."
  tar zxf kubernetes-server-linux-amd64.tar.gz
  mv -f kubernetes/server/bin/kube-apiserver ../bin
  mv -f kubernetes/server/bin/kube-controller-manager ../bin
  mv -f kubernetes/server/bin/kubectl ../bin
  mv -f kubernetes/server/bin/kubelet ../bin
  mv -f kubernetes/server/bin/kube-proxy ../bin
  mv -f kubernetes/server/bin/kube-scheduler ../bin
else
  echo 请先下载kubernetes-server-linux-amd64.tar.gz
fi

### 准备docker程序
echo "准备docker二进制程序..."
if [ -f "docker-18.03.1-ce.tgz" ]; then
  echo "extracting docker binaries..."
  tar zxf docker-18.03.1-ce.tgz
  mv -f docker/docker* ../bin
  if [ -f "docker/completion/bash/docker" ]; then
    mv -f docker/completion/bash/docker ../roles/docker/files/docker
  fi
else
  echo 请先下载docker-18.03.1-ce.tgz
fi

### 准备cni plugins，仅安装flannel需要，安装calico由容器专门下载cni plugins 
echo "准备cni plugins，仅安装flannel需要，安装calico由容器专门下载cni plugins..."
if [ -f "cni-plugins-amd64-v0.7.1.tgz" ]; then
  echo "extracting cni plugins binaries..."
  tar zxf cni-plugins-amd64-v0.7.1.tgz
  mv -f bridge ../bin
  mv -f flannel ../bin
  mv -f host-local ../bin
  mv -f loopback ../bin
  mv -f portmap ../bin
else
  echo 请先下载cni-plugins-amd64-v0.7.1.tgz
fi
