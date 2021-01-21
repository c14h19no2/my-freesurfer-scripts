lhMeah = gifti('lh.inflated.freesurfer.gii');
% Import from /cat12/templates_surfaces
lhV1   = gifti('s2.lh.fsaverage.V1raw.gii');
lhV2   = gifti('s2.lh.fsaverage.V2raw.gii');
lhV3   = gifti('s2.lh.fsaverage.V3raw.gii');
lhV4   = gifti('s2.lh.fsaverage.ips_mask.gii');

lhV1.cdata(lhV1.cdata<0.5)=0; lhV1.cdata(lhV1.cdata>=0.5)=1;
lhV2.cdata(lhV2.cdata<0.5)=0; lhV2.cdata(lhV2.cdata>=0.5)=1;
lhV3.cdata(lhV3.cdata<0.5)=0; lhV3.cdata(lhV3.cdata>=0.5)=1;
lhV4.cdata(lhV4.cdata<0.15) =0; 
lhV4.cdata(lhV4.cdata>=0.15)=1;

lhMeah.cdata = lhV1.cdata*1+lhV2.cdata*2+lhV3.cdata*3+lhV4.cdata*4;
lhMeah.cdata = round(lhMeah.cdata);
save(lhMeah,'s2.lh.fsaverage.bin.V123rawIPS.gii','Base64Binary')

rhMeah = gifti('rh.inflated.freesurfer.gii');
% Import from /cat12/templates_surfaces
rhV1   = gifti('s2.rh.fsaverage.V1raw.gii');
rhV2   = gifti('s2.rh.fsaverage.V2raw.gii');
rhV3   = gifti('s2.rh.fsaverage.V3raw.gii');
rhV4   = gifti('s2.rh.fsaverage.ips_mask.gii');

rhV1.cdata(rhV1.cdata<0.5)=0; rhV1.cdata(rhV1.cdata>=0.5)=1;
rhV2.cdata(rhV2.cdata<0.5)=0; rhV2.cdata(rhV2.cdata>=0.5)=1;
rhV3.cdata(rhV3.cdata<0.5)=0; rhV3.cdata(rhV3.cdata>=0.5)=1;
rhV4.cdata(rhV4.cdata<0.15) =0; 
rhV4.cdata(rhV4.cdata>=0.15)=1;

rhMeah.cdata = rhV1.cdata*1+rhV2.cdata*2+rhV3.cdata*3+rhV4.cdata*4;
rhMeah.cdata = round(rhMeah.cdata);
save(rhMeah,'s2.rh.fsaverage.bin.V123rawIPS.gii','Base64Binary')

c = [30,141,63; 0,110,160; 190,22,120; 240,140,70]./255;

sunvs_display('s2.lh.fsaverage.bin.V123rawIPS.gii', ...
    'multisurf', 0, ...
    'useAverageSurf', 'patch', ...
    'useUnderlay', 'mc', ...
    'Colormap', c, ...
    'TransParency', 0,...
    'imgprint', 1,...
    'view', 'l');
close;
sunvs_display('s2.rh.fsaverage.bin.V123rawIPS.gii', ...
    'multisurf', 0, ...
    'useAverageSurf', 'patch', ...
    'useUnderlay', 'mc', ...
    'Colormap', c, ...
    'TransParency', 0,...
    'imgprint', 1,...
    'view', 'r');
close;