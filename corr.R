corr <- function(directory, threshold = 0) {
  ## 'directory' �ǳ���Ϊ1���ַ�������ָ��
  ##  CSV �ļ���λ��
  
  ## 'threshold' �ǳ���Ϊ1����ֵ������ָ��
  ## �����۲�İ��������� (�������
  ## ����) �Ǳ���ģ�Ϊ�˼���������������ԣ�
  ## ������(nitrate)��������(sulfate); Ĭ��ֵΪ 0
  
  ## ��������Ե���ֵ����
  files<-list.files(directory,full.name=TRUE)
  data<-data.frame()
  ls<-complete(directory)
  idls<-ls$id[ls$nobs>threshold]
  if (length(idls)>0){
  co<-1:length(idls)
  for (i in 1:length(idls))
  {
  data<-read.csv(files[idls[i]])
  co[i]<-cor(data$nitrate,data$sulfate,use="complete.obs")
  }
  }
  else
  {
   co<-vector("numeric",length=0)
  }
  co
}