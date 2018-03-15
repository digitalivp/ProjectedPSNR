function [ppsnr] = projected_PSNR_cube(Vorg, Corg_rgb, V, C_rgb, luma_only)

	if(luma_only==1)
		Corg_rgb = RGBtoYUV(Corg_rgb);
		C_rgb = RGBtoYUV(C_rgb);
	end

	img_org  = get_views(Vorg, Corg_rgb);

	img_rec = get_views(V, C_rgb);

	ppsnr = 0;

	nviews = size(img_org,2);

	compound_img_org = cat(2, img_org{1}, img_org{2}, img_org{3}, ...
							img_org{4}, img_org{5}, img_org{6});

	compound_img_rec = cat(2, img_rec{1}, img_rec{2}, img_rec{3}, ...
							img_rec{4}, img_rec{5}, img_rec{6});

	if(luma_only==1)
		ppsnr = PSNR(compound_img_org(:,:,1), compound_img_rec(:,:,1));
	else
		ppsnr = PSNR(compound_img_org(:), compound_img_rec(:));
	end

return

function imgs = get_views(V, C_rgb)

	% vector conditioning 
	if( sum(min(V)<=0) )
		V = V + -1.*(min(V)<=0).*min(V) + (min(V)<=0);
	end

	N = 2.^ceil(log2(max(max(V))+1));

	views = 6;

	imgs = cell(1, views);	

	imgs{1} = cube_projection([N-V(:,1) V(:,2) N-V(:,3)], C_rgb, N, [1 2 3]);
	imgs{2} = cube_projection(V, C_rgb, N, [1 2 3]);
	imgs{3} = cube_projection([V(:,3) V(:,2) N-V(:,1)], C_rgb, N, [1 2 3]);
	imgs{4} = cube_projection([N-V(:,3) V(:,2) V(:,1)], C_rgb, N, [1 2 3]);
	imgs{5} = cube_projection([V(:,1) N-V(:,3) V(:,2)], C_rgb, N, [1 2 3]);
	imgs{6} = cube_projection([V(:,1) V(:,3) N-V(:,2)], C_rgb, N, [1 2 3]);

return

function img = cube_projection(V, C, N, V_order)

	img = 128*ones(N,N,3);

	[sV si] = sortrows(V, V_order);
	sC = C(si,:);
	n = ones(size(V,1),1);

	for k = 1:3
		img( ...
			sub2ind([N N 3], ...
				sV(:,V_order(2)), ...
				sV(:,V_order(1)), ...
				k*n) ...
			) = sC(:,k);
	end

	img = uint8(min(max(img,0),255));

return