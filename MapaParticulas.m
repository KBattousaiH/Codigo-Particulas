%% Partículas
%
close all
clear all
start
%
% Mascara modelo
mask_rho=ncread('golfo_avg_CV.nc','mask_rho');
lat=ncread('golfo_avg_CV.nc','lat_rho');
lon=ncread('golfo_avg_CV.nc','lon_rho');
mask=find(mask_rho==0);
mask_rho=mask_rho(mask);
lat=lat(mask);
lon=lon(mask);
%
% Partículas
cv='OpenDrift_CV_6h_landmask.nc';
sv='OpenDrift_SV_6h_landmask.nc';
%
latcv=ncread(cv,'lat');
loncv=ncread(cv,'lon');
zcv=ncread(cv,'z');
%
latsv=ncread(sv,'lat');
lonsv=ncread(sv,'lon');
zsv=ncread(sv,'z');
%contourf(lon(:,:),lat(:,:),mask_rho(:,:))
%colorbar
% Define Colormap
graycolor = [.7 .7 .7];
%
%% CV
f1=figure();
for i=1:length(latcv(:,1))
hold on
    scatter3(loncv(i,:),latcv(i,:),zcv(i,:),10,zcv(i,:),'filled');    
end
colormap('jet')
c = colorbar;
caxis([-70 0])
scatter(lon,lat,7,graycolor)
grid on
ylim([-37.2565 -36.6394])
xlim([-73.9278 -73.1056])
j = axes(f1,'visible','off');
j.Title.Visible = 'on';
j.XLabel.Visible = 'on';
j.YLabel.Visible = 'on';
sgtitle('Trayectoria de partículas con viento','FontSize',15)
ylabel(j,'Latitud','FontWeight','bold');
xlabel(j,'Longitud','FontWeight','bold');
set(get(c,'title'),'string','[m]');
set(gcf,'position',[10,10,600,500])
saveas(f1,'Mapa_Particulas_CV_6h','png');
%
%% SV
f2=figure();
for i=1:length(latcv(:,1))
hold on
    scatter3(lonsv(i,:),latsv(i,:),zsv(i,:),10,zsv(i,:),'filled');    
end
colormap('jet')
c = colorbar;
caxis([-70 0])
scatter(lon,lat,7,graycolor,'filled')
grid on
ylim([-37.2565 -36.6394])
xlim([-73.9278 -73.1056])
j = axes(f2,'visible','off');
j.Title.Visible = 'on';
j.XLabel.Visible = 'on';
j.YLabel.Visible = 'on';
sgtitle('Trayectoria de partículas sin viento','FontSize',15)
ylabel(j,'Latitud','FontWeight','bold');
xlabel(j,'Longitud','FontWeight','bold');
set(get(c,'title'),'string','[m]');
set(gcf,'position',[10,10,600,500])
saveas(f2,'Mapa_Particulas_SV_6h','png');
%
%% CV
f1=figure();
for i=1:length(latcv(:,1))
hold on
    %scatter3(loncv(i,:),latcv(i,:),zcv(i,:),10,zcv(i,:),'filled');    
    scatter(loncv(i,1:10000),latcv(i,1:10000),4,'red','filled')
    scatter(loncv(i,10001:20000),latcv(i,10001:20000),4,'cyan','filled')
    scatter(loncv(i,20001:30000),latcv(i,20001:30000),4,'blue','filled')
    scatter(loncv(i,30001:40000),latcv(i,30001:40000),4,'green','filled')
end
%colormap('jet')
%c = colorbar;
%caxis([-70 0])
scatter(lon,lat,7,graycolor,'filled')
grid on
ylim([-37.2565 -36.6394])
xlim([-73.9278 -73.1056])
j = axes(f1,'visible','off');
j.Title.Visible = 'on';
j.XLabel.Visible = 'on';
j.YLabel.Visible = 'on';
sgtitle('Trayectoria de partículas con viento','FontSize',15)
ylabel(j,'Latitud','FontWeight','bold');
xlabel(j,'Longitud','FontWeight','bold');
set(get(c,'title'),'string','[m]');
set(gcf,'position',[10,10,600,500])
saveas(f1,'Mapa_Particulas_CV_6h','png');


f1=figure();
for i=1:length(latcv(:,1))
hold on
    %scatter3(loncv(i,:),latcv(i,:),zcv(i,:),10,zcv(i,:),'filled');    
    scatter(lonsv(i,1:10000),latsv(i,1:10000),4,'red')
    scatter(lonsv(i,10001:20000),latsv(i,10001:20000),4,'cyan','filled')
    scatter(lonsv(i,20001:30000),latsv(i,20001:30000),4,'blue','filled')
    scatter(lonsv(i,30001:40000),latsv(i,30001:40000),4,'green','filled')
end
%colormap('jet')
%c = colorbar;
%caxis([-70 0])
scatter(lon,lat,7,graycolor,'filled')
grid on
ylim([-37.2565 -36.6394])
xlim([-73.9278 -73.1056])
j = axes(f1,'visible','off');
j.Title.Visible = 'on';
j.XLabel.Visible = 'on';
j.YLabel.Visible = 'on';
sgtitle('Trayectoria de partículas sin viento','FontSize',15)
ylabel(j,'Latitud','FontWeight','bold');
xlabel(j,'Longitud','FontWeight','bold');
set(get(c,'title'),'string','[m]');
set(gcf,'position',[10,10,600,500])
saveas(f1,'Mapa_Particulas_SV_6h','png');
