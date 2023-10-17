clc;
clear;
close all;

%%===================== Contributions of regional to global land ET IAV ================
% The algorithm: see the reference: Ahlstr?m, et al. Science,2015.
%---------------------------------------------------------------------------------------

% load the ET IAV data of global land and different regions

 SiTH_IAV = xlsread('SiTH_ET_IAV.xlsx'); 
 
 global_IAV = SiTH_IAV(:,2);  % global IAV data 
 
 NH_IAV = SiTH_IAV(:,3);      % the ET IAV in the Northern Hemisphere (10N-80N)
 
 WET_IAV = SiTH_IAV(:,4);     % the ET IAV in wet regions of the Northern Hemisphere
 
 TP_IAV = SiTH_IAV(:,5);      % the ET IAV in tropical region (10N-20S)
 
 ST_IAV = SiTH_IAV(:,6);      % the ET IAV in the southern temperate zone (20S-60S)
 
 
 %%------------------------------calculate the contributions--------------------------
 
 % Contributions in the Northern Hemisphere (10N-80N)
 CR_NH_IAV = (NH_IAV.*abs(global_IAV))./global_IAV;     CR_NH_IAV = sum(CR_NH_IAV)/sum(abs(global_IAV));
 
 % Contributions in the wet regions of the Northern Hemisphere (10N-80N)
 CR_WET_IAV = (WET_IAV.*abs(global_IAV))./global_IAV;   CR_WET_IAV = sum(CR_WET_IAV)/sum(abs(global_IAV));
 
 % Contributions in the tropical regions (10N-20S)
 CR_TP_IAV = (TP_IAV.*abs(global_IAV))./global_IAV;     CR_TP_IAV = sum(CR_TP_IAV)/sum(abs(global_IAV));
 
 % Contributions in the southern temperate zone (20S-60S)
 CR_ST_IAV = (ST_IAV.*abs(global_IAV))./global_IAV;     CR_ST_IAV = sum(CR_ST_IAV)/sum(abs(global_IAV));
 
 
 %%========================Finish preogram=================================================================
