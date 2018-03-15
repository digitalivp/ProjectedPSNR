function [V, C] = ply_read(filename)

fid = fopen(filename,'r');
a = char(fread(fid, Inf))';
fclose(fid);
s = strfind(a,'end_header')+length('end_header');
h = a(1:(s-1));
n1 = strfind(h, 'element vertex ') + length('element vertex ');
n2 = find(h(n1:end)==char(10),1)+n1-1;
N = str2num(h(n1:(n2-1)));
n3 = strfind(h(n2+1:end),'element')+n2;
if length(n3)==0
	num_props = length(strfind(h(n2+1:end),'property'));
else
	num_props = length(strfind(h(n2+1:n3), 'property'));
end
a = a(s:end);
a = a((find(a==char(10),1)+1):end);
if strfind(h,'format binary')
	switch num_props
		case 3
			C = [];
			V = typecast(a, 'single');
			V = double(reshape(V, [3 length(V)/3])');
		case 6
			V = zeros(N,3);
			V(:,1) = typecast(vec([a(1:15:end); a(2:15:end);  a(3:15:end);  a(4:15:end)]), 'single');
			V(:,2) = typecast(vec([a(5:15:end); a(6:15:end);  a(7:15:end);  a(8:15:end)]), 'single');
			V(:,3) = typecast(vec([a(9:15:end); a(10:15:end); a(11:15:end); a(12:15:end)]), 'single');
			C = double([a(13:15:end)' a(14:15:end)' a(15:15:end)']);
	end
elseif strfind(h,'format ascii')
	find_jmps = find(a==char(10));
	switch num_props
		case 3
			C = [];
			V = reshape(sscanf(a(1:find_jmps(N)),'%f %f %f'),[3 N])';
		case 6
			VC = reshape(sscanf(a(1:find_jmps(N)),'%f %f %f %d %d %d'),[6 N])';
			V = VC(:,1:3);
			C = VC(:,4:6);
	end	
end