
layers = [imageInputLayer([24 6 3],'Normalization','none');
          convolution2dLayer(3,30,'Padding',1);
          reluLayer();
          convolution2dLayer(3,50,'Padding',1);
          reluLayer();
          fullyConnectedLayer(100);
          reluLayer();
          fullyConnectedLayer(2);
          softmaxLayer();
          classificationLayer()];

opts = trainingOptions('sgdm','Verbose',0,'InitialLearnRate',0.05,'MiniBatchSize',1024,'MaxEpochs',10);
[d,w]=play_cube([],1,n_train);

% for k=1:2
%     tic
%     if k==1
%         n_train=10000;   % number of games to play for training
%         n_test=10000;    % number of games to play for testing
%         % play ng games between two players who play randomly
%         [d,w]=play_games(game,[],1,[],1,n_train);
%     else
%         n_train=20000;   % number of games to play for training
%         n_test=20000;    % number of games to play for testing
%         % play ng games between two players using the previous generation value network
%         % introduce randomness in moves for robustness
%         mt=floor(game.nx*game.ny/2);
%         r1r=rand(n_train,1);
%         r2r=rand(n_train,1);
%         r1k=randi(mt*2,n_train,1);
%         r2k=randi(mt*2,n_train,1);
%         r1=(r1k>mt).*r1r+(r1k<=mt).*(-r1k);
%         r2=(r2k>mt).*r2r+(r2k<=mt).*(-r2k);
%         [d,w]=play_games(game,net{k-1},r1,net{k-1},r2,n_train);
%     end
%     toc
%     % data augmentation
%     [d,w]=data_augmentation(d,w);
%     % train the next generation value network
% 
%     net{k}=trainNetwork(d,w,layers,opts);
%     toc
% 
%     disp(sprintf('Evaluating generation %d neural network', k))
%     s=play_games(game,net{k},0,[],1,n_test);
%     win1(k)=s(1); loss1(k)=s(2); tie1(k)=s(3);
%     disp(sprintf('  net plays black: win=%f, loss=%f, tie=%f', win1(k), loss1(k), tie1(k)))
%     s=play_games(game,[],1,net{k},0,n_test);
%     win2(k)=s(2); loss2(k)=s(1); tie2(k)=s(3);
%     disp(sprintf('  net plays white: win=%f, loss=%f, tie=%f', win2(k), loss2(k), tie2(k)))
%     telapsed{k}=toc;
%     toc
%     disp(' ')
%     save('temp.mat','net','win1','loss1','tie1','win2','loss2','tie2','telapsed')    % save variables
% end