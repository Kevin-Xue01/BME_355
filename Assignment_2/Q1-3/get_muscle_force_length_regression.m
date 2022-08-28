function [force_length_regression] = get_muscle_force_length_regression()
%%% TASK 2

% Input Parameters
% data(:,1): samples of an independent variable
% data(:,2): corresponding samples of a dependent variable

% Output
% force_length_regression: the genered Gaussian model

%     WRITE CODE HERE
%      1) Use WebPlotDigitizer to extract force-length points
%     from Winters et al. (2011) Figure 3C, which is on Learn. Click
%     "View Data", select all, cut, and paste below. 
%     2) Normalize the data so optimal length = 1 and peak = 1. 
%     3) Return a Regression object that  uses Gaussian basis functions.

% Define data points
data = [37.40112994350282, 9.67741935483869
39.37853107344633, 3.655913978494624
61.41242937853107, 76.7741935483871
61.41242937853107, 79.56989247311829
41.78750784682988, 1.9235364396654688
41.39516635279347, 14.617682198327358
41.39516635279347, 15.81242532855434
40.37507846829881, 17.753882915173236
38.41337099811676, 14.76702508960571
40.37507846829881, 21.78614097968935
39.23728813559322, 24.474313022700116
41.39516635279347, 26.863799283154123
42.88606403013183, 23.72759856630823
43.39610797237916, 23.876941457586597
43.82768361581921, 22.23416965352449
41.39516635279347, 31.792114695340487
42.06214689265537, 32.09080047789725
40.37507846829881, 36.72043010752688
42.51115993583037, 42.01795433426257
43.38302992257795, 35.17307181733703
43.41027585966381, 34.75823045267488
43.38302992257795, 44.610712863401034
42.838111180860714, 46.37378866321518
42.838111180860714, 48.3442851453604
43.110570551719334, 50.31478162750564
44.39112959475483, 45.544105933890876
45.56270488944689, 43.67731979291118
45.535458952361026, 46.581209345546256
46.70703424705309, 44.71442320456656
45.535458952361026, 46.062657639718566
45.37198332984586, 53.633512544802855
45.20850770733068, 54.04835390946502
43.46476773383553, 54.15206425063056
43.73722710469415, 57.05595380326564
44.39112959475483, 60.58210540289393
46.4073289391086, 62.76002256737024
47.41542861128549, 62.656312226204705
47.687887982144105, 66.7010155316607
48.96844702517961, 62.863732908535766
45.6989345748762, 67.73811894331608
45.94414800864895, 70.64200849595115
46.43457487619447, 71.47169122527546
47.41542861128549, 71.575401566441
46.4073289391086, 73.54589804858622
46.652542372881356, 75.51639453073145
47.08847736625515, 80.59820124784284
47.44267454837136, 81.53159431833268
47.60615017088652, 81.73901500066376
48.17831484968962, 83.39838045931236
48.96844702517961, 81.11675295367053
48.96844702517961, 82.15385636532591
49.7585792006696, 81.8427253418293
50.957400432447514, 80.18335988318069
51.14812199204855, 78.52399442453208
50.79392480993235, 78.00544271870437
50.57595731324545, 74.27187043674499
49.43162795563926, 76.13865657772469
48.886709213922025, 85.16145625912651
49.62234951524029, 86.50969069427852
49.7585792006696, 84.95403557679543
50.657695124503036, 84.95403557679543
50.657695124503036, 87.2356630824373
50.276252005300975, 87.44308376476836
50.657695124503036, 90.55439399973451
51.502319174164754, 89.62100092924467
51.72028667085165, 90.96923536439667
52.673894468856815, 89.10244922341698
53.27330508474577, 88.58389751758929
53.545764455604385, 83.29467011814683
53.545764455604385, 78.6277047656976
53.4640266443468, 94.70280764635605
53.62750226686197, 92.31746979954866
53.927207574806445, 91.90262843488651
54.14517507149334, 93.66570423470066
54.30865069400852, 94.39167662285942
53.57301039269025, 96.46588344617021
53.790977889377146, 96.77701446966682
54.662847876124715, 99.47348333997081
55.72543942247333, 96.05104208150804
56.10688254167539, 96.15475242267358
56.43383378670573, 99.78461436346743
56.815276905907794, 99.57719368113635
57.27845783636745, 97.8141178813222
57.5236712701402, 99.57719368113635
57.82337657808469, 99.26606265763974
57.08773627676641, 99.88832470463296
57.060490339680555, 99.05864197530866
58.55901687940295, 96.05104208150804
58.88596812443329, 99.05864197530866
59.34914905489293, 97.91782822248774
59.839575922438456, 96.77701446966682
59.948559670781904, 95.53249037568035
59.648854362837426, 95.73991105801144
58.42278719397365, 90.76181468206559
57.82337657808469, 91.0729457055622
59.34914905489293, 91.17665604672774
60.54797028667086, 93.56199389353512
61.33810246216085, 94.91022832868713
60.575216223756726, 99.57719368113635
62.31895619725188, 96.46588344617021
61.33810246216085, 91.79891809372097
62.20997244890843, 89.30986990574806
61.447086210504295, 87.75421478826499
61.256364650903265, 84.3317735298022
63.70849898863082, 89.72471127041021
63.1635802469136, 86.1985596707819
63.790236799888405, 86.92453205894067
64.49863116412081, 86.92453205894067
63.62676117737324, 85.78371830611975
63.62676117737324, 85.05774591796099
64.52587710120667, 81.8427253418293
63.844728674060136, 80.18335988318069
63.46328555485806, 79.56109783618746
63.43603961777221, 80.59820124784284
62.61866150519636, 79.66480817735298
63.953712422403584, 76.13865657772469
65.12528771709563, 76.34607726005575
66.43309269721699, 75.72381521306252
65.58846864755529, 72.81992566042746
66.10614145218666, 72.09395327226869
65.72469833298459, 68.15296030797823
65.75194427007045, 66.38988450816407
65.39774708795426, 64.10825700252224
67.223224872707, 63.27857427319793
66.86902769059078, 66.28617416699855
67.79538955151008, 62.656312226204705
68.4220461044849, 59.752422673569626
63.38154774360048, 59.44129165007301
63.38154774360048, 52.90754015664409
64.77109053497944, 53.633512544802855
64.77109053497944, 51.97414708615425
65.72469833298459, 47.92944378069825
67.4956842435656, 51.87043674498871
69.40289983957594, 41.706823310765955
67.03250331310596, 42.743926722421335
70.57447513426798, 48.655416168857016
67.41394643230802, 35.691623523164736
71.44634512101557, 34.75823045267488
73.46254446536933, 34.654520111509356
68.53102985282835, 27.394796229921667
70.22027795215179, 29.676423735563503
70.41099951175282, 29.883844417894593
72.42719885610659, 24.59461701845214
72.99936353490969, 25.631720430107507
73.43529852828347, 18.683127572016446
73.43529852828347, 17.74973450152659
74.4161522633745, 13.082769149077365
73.40805259119762, 12.771638125580765
75.42425193555138, 12.771638125580765
75.23353037595035, 17.853444842692127
76.45959754481413, 8.623224478959216];

% Normalization
data(:,2) = normalize(data(:,2),'range');
[~,I] = max(data(:,2));
A = [1/data(I, 1) 0; 0 1];
data = (A*data')';

% Regression with "fit" function with "gauss2" option as model type
force_length_regression = fit(data(:,1),data(:,2),'gauss2');

end