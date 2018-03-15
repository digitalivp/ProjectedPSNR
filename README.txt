projected_PSNR_cube is a Matlab/Octave function which provides the Projected PSNR metric (P-PSNR) as proposed on ISO/IEC JTC1/SC29/WG1 input document M78030.

To test it, run test_ppsnr. The expected answer is:
ppsnr =  31.746
ppsnr_y =  31.817

To provide a suitable execution environment to test_psnr, the following files should be present:
- man2_f093_lp.ply and man2_f093.ply: two voxelized point clouds recorded in PLY format. The Man sequence was derived from the Microsoft HoloLens Capture (HCap) mesh sequence Man.
- ply_read.m: a function to read PLY files;
- projected_PSNR_cube.m: a function that provides P-PSNR evaluation for 3D RGB signals;
- PSNR.m: a function to evaluate PSNR between two signals that have the same sample count;
- test_ppsnr.m: the example script.

The .m files are distributed according to a MIT License:

Copyright (c) 2018 Universidade de Brasilia

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



