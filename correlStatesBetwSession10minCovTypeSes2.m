clear
clc
close all


dataLength='all_10min';

winSize=69;

resultDir=['/home/data/Projects/microstate/DPARSF_preprocessed/results/645/', dataLength, filesep, 'GSR/session2/clustMean/'];
resultDir0=['/home/data/Projects/microstate/DPARSF_preprocessed/results/645/', dataLength, filesep, 'GSR/session1/clustMean/'];
resultDir1=['/home/data/Projects/microstate/DPARSF_preprocessed/results/645/',dataLength,'/noGSR/session2/'];
resultDir2=['/home/data/Projects/microstate/DPARSF_preprocessed/results/645/',dataLength,'/noGSR/session1/'];

figDir=['/home/data/Projects/microstate/DPARSF_preprocessed/fig/645/',dataLength, '/correlDifCovType/'];

covType1='noGSR';

numClust0=5;
numClust=6;
numClust1=4;
numClust2=4;
tmp=load([resultDir,'clusterMean_',num2str(numClust),'clusters_session2_normWin.mat']);
tmp0=load([resultDir0,'clusterMean_',num2str(numClust0),'clusters_session1_normWin.mat']);
tmp1=load([resultDir1,sprintf('clusterMean_%dclusters_session2_noGSR_win%d_normWin.mat',numClust1,winSize)]);
tmp2=load([resultDir2,sprintf('clusterMean_%dclusters_session1_noGSR_win%d_normWin.mat',numClust2,winSize)]);
clustMean=tmp.finalMeanWinOfClust;
clustMeanTransp=clustMean';

clustMean0=tmp0.finalMeanWinOfClust;
clustMeanTransp0=clustMean0';

clustMean1=tmp1.finalMeanWinOfClust;
clustMeanTransp1=clustMean1';

clustMean2=tmp2.finalMeanWinOfClust;
clustMeanTransp2=clustMean2';

cmb0=[clustMeanTransp0,clustMeanTransp];
cmb1=[clustMeanTransp0,clustMeanTransp1];
cmb2=[clustMeanTransp,clustMeanTransp2];
cmb3=[clustMeanTransp1,clustMeanTransp2];
[corClust0,pValue0]=corrcoef(cmb0);
[corClust1,pValue1]=corrcoef(cmb1);
[corClust2,pValue2]=corrcoef(cmb2);
[corClust3,pValue3]=corrcoef(cmb3);


ColorMap=[1,1,0;1,0.9,0;1,0.8,0;1,0.7,0;1,0.6,0;1,0.5,0;0,0.5,1;0,0.6,1;0,0.7,1;0,0.8,1;0,0.9,1;0,1,1;];
ColorMap=flipdim(ColorMap,1);
cmap1 = colorRamp(ColorMap(1:6,:), 32);
cmap2= colorRamp(ColorMap(7:end,:), 32);
ColorMap=vertcat(cmap1,cmap2)

figure(1)
imagesc(corClust1)
h=figure(1);
colorbar
caxis([-1 1])
%set(gca,'xTick',0.5:5.5, 'yTick', 0.5:5.5,'XTickLabel',[],'YTickLabel',[]);
set(gca,'LineWidth',2)

%set(figure(1),'Colormap',ColorMap)  % this is used to generate the
%first graph for eiditing the colormap
grid off
set(gca, 'GridLineStyle', '-' )
xlabel('clusters of GSR: 1-5; clusters of noGSR: 6-10')
ylabel('clusters of GSR: 1-5; clusters of noGSR: 6-10')
title('Correlations between clusters of GSR and noGSR')
set(h,'Position',[1,1,800,665])
saveas(figure(1),[figDir,'CorrelGSRAndnoGSR_zWinFullCorLasso_session2.png'])

figure(2)
imagesc(corClust2)
h=figure(2);
colorbar
caxis([-1 1])
%set(gca,'xTick',0.5:5.5, 'yTick', 0.5:5.5,'XTickLabel',[],'YTickLabel',[]);
set(gca,'LineWidth',2)

grid off
set(gca, 'GridLineStyle', '-' )
xlabel('clusters of GSR: 1-5; clusters of compCor: 6-9')
ylabel('clusters of GSR: 1-5; clusters of compCor: 6-11')
title('Correlations between clusters of GSR and compCor')
set(h,'Position',[1,1,800,665])
saveas(figure(2),[figDir,'CorrelGSRAndcompCor_zWinFullCorLasso.png'])


figure(3)
imagesc(corClust3)
h=figure(3);
colorbar
caxis([-1 1])
%set(gca,'xTick',0.5:5.5, 'yTick', 0.5:5.5,'XTickLabel',[],'YTickLabel',[]);
set(gca,'LineWidth',2)

grid off
set(gca, 'GridLineStyle', '-' )
xlabel('clusters of noGSR: 1-4; clusters of compCor: 5-8')
ylabel('clusters of noGSR: 1-4; clusters of compCor: 5-8')
title('Correlations between clusters of noGSR and compCor')
set(h,'Position',[1,1,800,665])
saveas(figure(3),[figDir,'CorrelnoGSRAndcompCor_zWinFullCorLasso.png'])

figure(4)
imagesc(corClust0)




