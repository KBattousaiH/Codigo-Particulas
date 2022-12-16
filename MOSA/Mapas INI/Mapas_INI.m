%% Mapas Superdiciales 
%
close all
clear all
addpath('/home/asepulveda2/MOSA_BGQ_FUNCIONA/Pronostico/PRUEBA_ANIDADOS_A/')
start
% SST SSS  dQdS ST
ini='croco_ini.nc';
ini1='croco_ini.nc.1';
ini2='croco_ini.nc.2';
ini3='croco_ini.nc.3';
%
grd='croco_grd.nc';
grd1='croco_grd.nc.1';
grd2='croco_grd.nc.2';
grd3='croco_grd.nc.3';
%
h=ncread(grd,'h');
%
lat=ncread(grd,'lat_rho'); latu=ncread(grd,'lat_u'); latv=ncread(grd,'lat_v');
lon=ncread(grd,'lon_rho'); lonu=ncread(grd,'lon_u'); lonv=ncread(grd,'lon_v');
% lat1=ncread(grd1,'lat_rho');
% lon1=ncread(grd1,'lon_rho');
% lat2=ncread(grd2,'lat_rho');
% lon2=ncread(grd2,'lon_rho');
% lat3=ncread(grd3,'lat_rho');
% lon3=ncread(grd3,'lon_rho');
%
SST=ncread(ini,'temp'); SST=SST(:,:,42);
SSS=ncread(ini,'salt'); SSS=SSS(:,:,42);
zeta=ncread(ini,'zeta');
SSU=ncread(ini,'u'); SSU=SSU(:,:,42);
SSV=ncread(ini,'v'); SSV=SSV(:,:,42);
%
VAR(:,:,1)= h; VAR(:,:,2)= zeta; VAR(:,:,3)= SST; VAR(:,:,4)= SSS; 
TIT=[' Batimetría de la zona ';'     Nivel del Mar     ';'Temperatura Superficial';' Salinidad Superficial '];
Imag=['bat';'NiM';'SST';'SSS'];
varn=[' m ';' m ';' ºC';'PSU'];
rang=[0,5000 ; -0.2,0.2 ; 7,18 ; 30,34.5];
%% T S h SL
for i=1:4
f1(i)=figure(i);
   % sgtitle('SST','FontSize',22)
	m_proj('equidistant','lon',[min(min(lon)) max(max(lon))],'lat',[min(min(lat)) max(max(lat))]);
    m_pcolor(lon,lat,VAR(:,:,i)),shading interp;
    hold on
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
%     %m_coast('color','black','linewi',2)
%     %m_contourf(X,Y,DOM,[1:1:44],'-','ShowText','off')
    if i==1
        cmocean('deep');
    elseif i==2
        colormap('parula');
    elseif i==3
        colormap('jet');
    else
        cmocean('haline');
    end
    caxis([rang(i,1) rang(i,2)])
%    colormap('jet')
%     cmocean('dense')
% % set colorbar
    title(TIT(i,:))
     j = axes(f1(i),'visible','off');
     j.Title.Visible = 'on';
     j.XLabel.Visible = 'on';
     j.YLabel.Visible = 'on';
     ylabel(j,'Latitud','FontWeight','bold');
     xlabel(j,'Longitud','FontWeight','bold');
%     %c = colorbar(j,'Position',[0.91 0.15 0.03 0.73]); 
     c = colorbar(j);
     set(get(c,'title'),'string',varn(i,:)); caxis(j,[rang(i,1) rang(i,2)]);
     if i==1
        cmocean('deep');
    elseif i==2
        colormap('parula');
    elseif i==3
        colormap('jet');
    else
        cmocean('haline');
    end
%     cmocean('dense')
    set(gcf,'position',[10,10,500,600])
    saveas(f1(i),Imag(i,:),'png');
end
%
f=figure();
   % sgtitle('SST','FontSize',22)
	m_proj('equidistant','lon',[min(min(lonu)) max(max(lonu))],'lat',[min(min(latu)) max(max(latu))]);
    m_pcolor(lonu,latu,SSU),shading interp;
    hold on
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
        cmocean('balance');
    caxis([-0.27 0.27])
%    colormap('jet')
%     cmocean('dense')
% % set colorbar
    title('Velocidad Zonal Superficial')
     j = axes(f,'visible','off');
     j.Title.Visible = 'on';
     j.XLabel.Visible = 'on';
     j.YLabel.Visible = 'on';
     ylabel(j,'Latitud','FontWeight','bold');
     xlabel(j,'Longitud','FontWeight','bold');
%     %c = colorbar(j,'Position',[0.91 0.15 0.03 0.73]); 
     c = colorbar(j);
     set(get(c,'title'),'string','m/s'); caxis(j,[-0.27 0.27]);
        cmocean('balance');
%     cmocean('dense')
    set(gcf,'position',[10,10,500,600])
    saveas(f,'SSU','png');
    %
    f=figure();
   % sgtitle('SST','FontSize',22)
	m_proj('equidistant','lon',[min(min(lonv)) max(max(lonv))],'lat',[min(min(latv)) max(max(latv))]);
    m_pcolor(lonv,latv,SSV),shading interp;
    hold on
    m_gshhs_f('patch',[.7 .7 .7],'EdgeColor','k')
    m_grid('linewi',2,'tickdir','out','fontsize',10); % Tamaño nº coordenadas
        cmocean('balance');
    caxis([-0.45 0.45])
%    colormap('jet')
%     cmocean('dense')
% % set colorbar
    title('Velocidad Meridional Superficial')
     j = axes(f,'visible','off');
     j.Title.Visible = 'on';
     j.XLabel.Visible = 'on';
     j.YLabel.Visible = 'on';
     ylabel(j,'Latitud','FontWeight','bold');
     xlabel(j,'Longitud','FontWeight','bold');
%     %c = colorbar(j,'Position',[0.91 0.15 0.03 0.73]); 
     c = colorbar(j);
     set(get(c,'title'),'string','m/s'); caxis(j,[-0.45 0.45]);
        cmocean('balance');
%     cmocean('dense')
    set(gcf,'position',[10,10,500,600])
    saveas(f,'SSV','png');