clc;
clear;
close all;
%%====================Contributions of regional to global land ET trend================= %%

% load the wet and dryland regions in global land 
Arid_index = load('terraclimate_19611990_arid_index.mat');  
AI = flipud(rot90(Arid_index.ratio)); AI_C = resizem(AI,[720,1440]); % Interpolating the spatial resolution to 0.25 degree

% load land cover dataset
LC = hdfread('MCD12C1.A2001001.006.2018053185512.hdf', 'MOD12C1', 'Fields', 'Majority_Land_Cover_Type_1');
LC_C = resizem(LC,[720,1440]);   LC_C(LC_C==0) = NaN;  % Interpolating the spatial resolution to 0.25 degree

% load the area of each grids
land_area = load('global_land_grid_area.mat');  
grid_area = land_area.area;

% load the SiTH ET trend
sith = load('SiTH_ET_MK_trend_1982_2020.mat'); 
et_trend = sith.trend; 

% Unify the grid  
LC_C(isnan(AI_C)==1) = NaN;
AI(isnan(LC_C)==1) = NaN;
grid_area(isnan(LC_C)==1) = NaN;
et_trend(isnan(LC_C)==1) = NaN;
et_trend(isnan(sith.Strend)==1)=NaN;

% area of global and different regions
global_land = grid_area; global_land(1:40,:) = NaN; global_land(601:end,:) = NaN;

% 10N-80N 
NH = global_land;  NH(321:end,:) = NaN; NH(1:40,:) = NaN;
NH_WET = NH; NH_WET(AI_C<0.65) = NaN;   % wet regions in 10N-80N latitudes

% tropical region (10N-20S)
TP = global_land; TP(1:320,:) = NaN;  TP(441:end,:) = NaN;

% southern temperate zone (20S-60S)
ST = global_land; ST(1:440,:) = NaN; ST(601:end,:) = NaN;

% calculate contrbutions of ET trend in different regions to global land

global_trend_total = sum(sum(global_land.*et_trend,2,'omitnan'),1,'omitnan');
CR_NH = (sum(sum(NH.*et_trend,2,'omitnan'),1,'omitnan'))./global_trend_total;
CR_NH_WET =  (sum(sum(NH_WET.*et_trend,2,'omitnan'),1,'omitnan'))./global_trend_total;
CR_TP = (sum(sum(TP.*et_trend,2,'omitnan'),1,'omitnan'))./global_trend_total;
CR_ST = (sum(sum(ST.*et_trend,2,'omitnan'),1,'omitnan'))./global_trend_total;
 
%===============================finish program=====================================%

