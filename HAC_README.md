# Human-Age-Classification-using-Facial-Images-and-Image-Recognition-Algorithms-
Developed a system capable of classifying human facial images into different age groups using spatial, transform domain techniques and various machine learning algorithms to help identify aging patterns

The age estimation and classification is a very simple task for human, but it is very difficult for machine to classify age based on facial information. Many researchers have made efforts to achieve age classification using spatial and transform domain techniques with various classifiers. 
But transform domain classification is not as explored as spatial domain

This project concentrates on age classification in transform domain using different transforms as well as classifiers to find out the best possible combination of a transform and a classifier for age classification. To achieve this purpose a system is designed based on an algorithm which is further classified as training algorithm and testing algorithm. The training algorithm will provide us database feature vector matrix after applying a particular transform on database images. The testing algorithm will use the same transform which is used in training algorithm and apply it on query image(s) and provide us with query feature vector matrix. Using the database feature vector matrix as reference we classify the query image(s) into different age group viz. child, adolescent, young, middle aged and old aged using a particular classifier. This process is repeated for various combinations of transforms and classifiers. Both, the training and testing algorithms are divided into two parts viz. pre-processing the image and feature extraction using transforms. The testing algorithm has an additional part of using classifiers to classify the query image into an age group.
Following are training and testing algorithms:
A.	Preprocessing of the Image

The images are gray scaled as luminance is more important in distinguishing visual features and grey scaled images contain only luminance information. After Grey scaling is done images are resized according to requirements of transform used. 

	 Feature Extraction using Transforms

Feature extraction is done in transform domain using following transforms viz.
	Discrete Cosine Transform(DCT)
	Discrete Wavelet Transform (DWT)
	Dual Tree Complex Wavelet Transform(DTCWT)
	GABOR Transform.
	Discrete Cosine Transform (DCT)

A discrete cosine transform (DCT) expresses a finite sequence of data points in terms of a sum of cosine functions oscillating at different frequencies [1]. In particular, a DCT is a Fourier-related transform similar to discrete Fourier transform (DFT) but using only real numbers. There are 8 different variants of DCT out of which 8*8 DCT is most efficient. The DCT, and in particular the DCT-2, is often used in signal and image processing, especially for lossy compression, because it has a strong "energy compaction" property. The DCT transforms images from Spatial domain to frequency domain. The low frequencies in an image are visually significant than high frequencies. The DCT relinquishes the high frequencies and rationalizes the remaining coefficients. Typically, the energy concentration is observed in top left corner. The 2D-DCT of M x N matrix of an image for every pixel is given by:
F(u,v)= C_u C_v ∑_(i=0)^7▒∑_(j=0)^7▒〖f(i,j)cos⁡〖(2i+1)uπ/16〗 〗   cos⁡〖((2j+1)vπ)/16〗     (1)
Where F(u, v) is DCT domain representation of f(i, j),the pixel value at co-ordinate(M,N) and u as well as v represent vertical and horizontal frequencies respectively.
                   		                                                               (2)
Every image in database of 100 images is divided in 8x8 blocks. The 2D DCT is applied on each block to get DCT coefficients. Due to energy compaction property of DCT, energy of every block gets concentrated in top left corner of each block. The feature vector is created by scanning top left corner in diagonally downward direction. The length of this feature vector is 5 and 9 as shown in Fig.2 and Fig. 3 respectively.


The Wavelet Transform is different from classical Fourier transform. The 2 dimensional Fast Fourier transform, when applied to an image, we get the real as well as imaginary parts of transformed image. The reason behind extensive use of Wavelet transform is due to the multi-resolution property of wavelet transform.

The formal definition of wavelet transform is given by
ψ_(a,b) (t)=1/(√(|a| )  ) ψ((t-b)/a),      a,bϵR,a≠0                         (3)
The parameter a is often termed as scale or scaling factor, and it represents the degree of scaling or compression of information. The term ψ((t-b)/a)  is called as the Basis function for the wavelet function defined above. The parameter b determines the time location of the wavelet. Depending upon the value of the scaling parameter a, the wavelet function ψ_(a,b) (t) has different value than singleton ‘mother wavelet’ function ψ(t). Thus, the above Wavelet functions have time widths adapted to their frequencies.
	Dual Tree Complex wavelet Transform(DTCWT)

The Dual Tree Complex wavelet Transform (DTCWT) is a complex valued extension to the standard discrete wavelet transform (DWT). It is a two-dimensional wavelet transform which provides multi-resolution, sparse representation and useful characterization of the structure of an image. The DTCWT calculates the complex transform of a signal using two separate DWT decompositions (tree a and tree b). If the filters used in one are especially designed different from those in the other it is possible for one DWT to produce the real coefficients and the other the imaginary. The dual-tree CWT is implemented as two separate two-channel filter banks. One cannot arbitrarily choose the scaling and wavelet filters used in two trees (tree a and tree b). The low-pass (scaling) and high-pass (wavelet) filters of one tree,{h0, h1} must generate a scaling function and wavelet that are approximate Hilbert transforms of the scaling function and wavelet generated by low-pass and high-pass filter of other tree,{g0, g1}. Therefore, the complex- valued scaling function and wavelet from the tree a and tree b are approximately analytic.
DTCWT decomposes image into 16 bands out of which 12 are high frequency bands while 4 are low frequency bands. The 12 high frequency bands consist of 6 real and 6 imaginary bands. Now DTCWT uses 15, 45 and 75 degree orientation as well as -15, -45 and -75 orientation to obtain high frequency bands. For low frequency bands DTCWT uses 0, 45 and 90 degree orientation. We know that low frequency bands of image contain image information while high frequency bands of image contain high frequency data like edge information. DTCWT is applied to low frequency bands for further decomposition of image.
	GABOR Transform

Gabor filter is widely used linear filter in image processing used for edge detection. Gabor filter finds its application in appropriate texture representation and discrimination, since the frequency and orientation representation of Gabor filters are similar to those of human visual system.
The Gabor kernel consists of Gaussian Kernel function modulated by sinusoidal plane wave.  The Gabor filter has its impulse response defined by a sinusoidal wave, which is multiplied by a Gaussian function. Due to multiplication-convolution property, the Fourier transform of Gabor filter’s impulse response is the convolution of the Fourier transform of sinusoidal plane wave or the harmonic function, and the Fourier transform of Gaussian function.   
Mathematical Definition of Gabor filters transfer function.
g(x,y;λ,θ,ψ,σ,γ)=e^(- (x^'2+γ^2 y^'2)/(2σ^2 ))  ∙e^(i (2Πx^')/λ+iψ)              (4)

Where x^'=xcosθ+ysinθ
And  y^'=-xsinθ+ycosθ
𝜆 represents the wavelength of the sinusoidal plane wave, 𝞱 is orientation of normal to the parallel stripes of Gabor function, ψ is phase shift,  is standard deviation of the Gaussian curve and γ is the aspect ratio in spatial domain.
	CLASSIFIERS

	Hybrid Variance
The hybrid variance is based on the concept of variance. It calculates how much the query image vector varies from the database image vector and classifies the query image into the nearest age group based on the variation.
	K- Nearest Neighbor Classifier(KNN)
The KNN classifier is very powerful and reliable classifier when it comes to machine learning algorithm. Its functionality is based on finding the nearest neighbor to a particular vector from given set of vectors. In KNN classifier, K indicates no. of neighbors taken into consideration for classification .In KNN classifier we have to provide 3 groups viz. SAMPLE, TRAINING and GROUP, where SAMPLE contains the database image feature matrix, TRAINING contains query image feature matrix and GROUP contain various age group in which query image is to be classified. 

	EUCLIDEAN DISTANCE
The Euclidean distance eqn. is given by:
D_E [(u,v)]=√(2&[(v_1-u_1 )^2+(v_2-u_2 )^2 ] )               (5)
Where,
 u=(u1,u2,….un)…….Database image feature vector matrix.
 v=(v1,v2,….vn)…….Query image feature vector matrix.


	CITYBLOCK DISTANCE
The City block distance eqn. is given by:
D_Ct (u,v)=∑_(i=1)^n▒|u_i-v_i |                                             (6)
Where,
 u=(u1,u2,….un)…….Database image feature vector matrix.
 v=(v1,v2,….vn)…….Query image feature vector matrix.

	COSINE DISTANCE
The Cosine distance eqn. is given by:
u.v=‖u‖  ‖v‖   cos⁡θ                                                    (7)
The cosine distance between vectors u and v ,  cos⁡θ is given by dot product and magnitude[10].
Where,
 U is Database image feature vector matrix.
 V is Query image feature vector matrix.

	CORRELATION DISTANCE
The correlation distance is given by formula:
D_Cor (u,v)=[(d_Cov (u,v))/√(d_Var (u)*d_Var (v) )](8)
The correlation distance is calculated by dividing distance covariance by product of distance standard deviation of u and v [9].
Where,
 U is Database image feature vector matrix.
 V is Query image feature vector matrix.

	   EXPERIMENTAL WORK

The proposed system is divided into two parts viz. training and testing. In training a database of 200 face-only images of 200 different subjects is created. The images are resized to dimensions as per the specific requirements of a particular transform. After the images are resized they are gray scaled since the luminance information provides us the necessary parameters for age classification than the chrominance information. This comprises of pre-processing. After pre-processing, feature extraction is carried out using in transform domain using transforms like DCT, DWT, DTCWT, and GABOR.
In 2D-DCT, it is observed that 8x8 block processing gives better results. The images are resized such that, 8x8 block processing can be applied on it. After applying 2D-DCT on every block the result is multiplied with an 8x8 mask for feature extraction. The feature extraction is done in two ways i.e. 5-vectored feature extraction as shown in Fig.1.a and 9-vectored feature extraction as shown in Fig.1.b. Same procedure is applied on query image(s) and using various classifiers the query image(s) is classified in various age groups viz. child, adolescent, young, middle aged and old aged.
In 2D-DWT, various types of wavelets were used viz. Debauchees’, Symlets, Dmeyer, Biorsplines, Reversebior. But since different wavelets have different size of filter coefficients, the result obtained is not ideal. So an algorithm is developed to achieve near ideal results for all 2D discrete wavelets. After applying 2D-DWT we get result in form of LL, LH, HL, HH which is nothing but approximate transform, horizontal transform, diagonal transform and vertical transform respectively. It is logical that more the decomposition of an image more information is obtained. The images are resized to 256x256 and 6 level decomposition is done on approximate part of result so that after final decomposition we get LL, LH, HL, HH which cannot be further decomposed. Using all these vectors from each level of decomposition a 22-vectored feature matrix is created for the database images. Same procedure is applied on query image(s) and using various classifiers the query image(s) is classified in various age groups. 
For 2D-DTCWT an algorithm is designed which generates DTCWT transform of image. First order decomposition is carried out using ‘faf’ first order filters. ‘faf’ is called as farras filters. Further decomposition is carried out using ‘af’ filters. As we define parameter “level”, ‘af’ filter is used for mentioned number of levels. Before implementing this system we need to include ‘faf’ filter coefficients and ‘af’ coefficients in same directory. Using these filters and dual tree complex wavelet function, dual tree complex wavelet transform of an image is achieved. This transform provides 16 vectors for each level of decomposition. In further levels, the decomposition is done on low frequency bands. The no. of levels of decomposition is subjective to quality of image and application. Using classifier the query image(s) is classified into various age groups.
Gabor filter transfer function consists of the Gaussian function modulated with the sinusoidal waveform. The parameters in Gabor filter transfer function are as follows:
θ= Angle in degrees or radians.
λ=Wavelength of harmonic function used (i.e. the sin wave)
ψ= Phase shift of the harmonic function. 
σ= standard deviation of the Gaussian function.
γ= aspect ratio of the each Gabor filter function created   using program.
The actual implementation involves the 2D convolution of the image taken and the Gabor filter function created. This results in the multiplication of those frequency components present in the image which are corresponding to specified lambda value for harmonic function specified. The Gaussian function ensures that only a specific portion or a band of harmonics is selected. By changing the value of the sigma, the Gaussian envelope can select different bands from the image.  
	RESULTS AND DISCUSSION

The algorithms are implemented in MATLAB for database of 200 images of 200 different subjects with 40 images of each class viz. child, adolescent, young, middle aged and old aged. The proposed method uses DCT, DWT, DTCWT and GABOR for feature extraction of facial images while variance, KNN classifier, Hybrid variance I and Hybrid variance II is used as a classifier. The variance classifiers give poor results across all transforms. To improve efficiency, KNN classifier is used and a steady improvement can be seen in all transforms. KNN classifier uses 4 different distances to find nearest neighbors.It was observed that from the 35 Debauchies, 7 Symlets, 15 Biorsplines and 14 reversebiorrs that were implemented using proposed algorithm, Db1 or ‘Haar’ wavelet provides maximum efficiency for all the classifiers used. DCT 5 and 9 vectored, both provide poor efficiency across all the classifiers except for Hybrid classifier II. Although DTCWT provides better feature extraction than DCT and DWT as it uses high as well as low frequency orientation, but it provides moderately poor efficiency for variance and KNN classifier but best efficiency for Hybrid variance I classifier. The GABOR transform stands apart from the rest transforms due to the freedom it provides for feature extraction. It gives best efficiency across all classifiers.

VI.	     CONCLUSION AND SCOPE

 This paper presents comparative analysis of Gabor transform for various classifiers viz. variance, KNN classifier, Hybrid variance I and Hybrid variance II. As it can be seen in TABLE I. Gabor transform provides best efficiency for all the classifiers used when compared to the efficiency given by DCT, DWT and DTCWT for same classifiers. Out of all the classifiers used Hybrid Variance II gives consistently better efficiency over all transforms while Hybrid transform I gives best efficiency of 87% for GABOR transform. Since this paper uses a particular small self-generated database of 200 images of 200 different subjects, the efficiency obtained is not close to 100 %. A more standard database like MORPH database, FG-NET database, GOOGLE database or any standard database may provide better efficiency. Pre-processing the image by using DoG filtering or Gamma correction may also provide better efficiency. This work can be further extended by using various other complex or discrete wavelet or rounded wavelet.
