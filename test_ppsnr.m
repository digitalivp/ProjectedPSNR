clear all

[Vorg Corg] = ply_read('man2_f093.ply');

[Vrec Crec] = ply_read('man2_f093_lp.ply');

luma_only=0;

ppsnr = projected_PSNR_cube(Vorg, Corg, Vrec, Crec, luma_only)

luma_only=1;

ppsnr_y = projected_PSNR_cube(Vorg, Corg, Vrec, Crec, luma_only)
