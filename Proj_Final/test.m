F = double(IR);
M = double(visible);

% [optimizer,metric] = imregconfig('monomodal');
optimizer = registration.optimizer.RegularStepGradientDescent();
metric = registration.metric.MeanSquares();


R = imregister(M,F,'similarity',optimizer,metric);

figure
imshowpair(R,F);

Rd = ib_bi_int(R,1536,2048);
Fd = ib_bi_int(F,1536,2048);

figure
ip_disp(Rd)