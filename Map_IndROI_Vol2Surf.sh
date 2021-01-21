# define variables
sub=sub-09
ROI=V1raw
workspace=$HOME/Workbench

# vol2vol (nii2mgz)
mri_convert \
    --in_type nii \
    --out_type mgz \
    $workspace/$ROI.nii.gz \
    $workspace/$ROI.mgz

    
# vol2surf (mgz2mgh)
mri_vol2surf \
    --src $workspace/$ROI.mgz \
    --out $workspace/lh.$ROI.mgh \
    --hemi lh \
    --regheader $sub

mri_vol2surf \
    --src $workspace/$ROI.mgz \
    --out $workspace/rh.$ROI.mgh \
    --hemi rh \
    --regheader $sub

# Resample & Smooth
mri_surf2surf \
    --srcsubject $sub \
    --trgsubject fsaverage \
    --hemi lh \
    --sval $workspace/lh.$ROI.mgh \
    --fwhm 4 \
    --tval $workspace/s2.lh.fsaverage.$ROI.mgh

mri_surf2surf \
    --srcsubject $sub \
    --trgsubject fsaverage \
    --hemi rh \
    --sval $workspace/rh.$ROI.mgh \
    --fwhm 4 \
    --tval $workspace/s2.rh.fsaverage.$ROI.mgh

# format convert (mgh2gii)
mri_convert \
    --in_type mgh \
    --out_type gii \
    $workspace/s2.lh.fsaverage.$ROI.mgh \
    $workspace/s2.lh.fsaverage.$ROI.gii

mri_convert \
    --in_type mgh \
    --out_type gii \
    $workspace/s2.rh.fsaverage.$ROI.mgh \
    $workspace/s2.rh.fsaverage.$ROI.gii
