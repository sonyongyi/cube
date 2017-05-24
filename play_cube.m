function [d,w]=play_cube(net1,r1,ng)
% plays 'ng' games between two neural networks net1 and net2
% optional parameter: max. number of moves per game
% returns dataset and labels
% game: game parameters
% net1: first neural network playing black. can be empty (in that case 'r1' should be 1)
% r1: randomness in the move, 0: no randomness, 1: pure random
%   if r1<0, then the first |r1| moves are random
% net2: second neural network playing white. can be empty (in that case 'r2' should be 1)
% r2: randomness in the move, 0: no randomness, 1: pure random
%   if r2<0, then the first |r2| moves are random
% ng: number of games to play
% Return values
%   stat=play_games(game,net1,r1,net2,r2,ng): statistics for net1, stat=[win loss tie]
%   [d,w,wp,stat]=play_games(game,net1,r1,net2,r2,ng)
%     d: 4-d matrix of size nx*ny*3*nb containing all moves, where nb is the total number of board configurations
%     w: nb*1, 0: tie, 1: black wins, 2: white wins
%     wp (optional):  win probabilities for the current player
%     stat (optional): statistics for net1, stat=[win loss tie], for net2 swap win & loss
%   [d_black,w_black,d_white,w_white,wp,stat]=play_games(game,net1,r1,net2,r2,ng)
%     d_black: 4-d matrix of size nx*ny*3*nb1 containing all moves by black
%     w_black: nb1*1, 0: tie, 1: black wins, 2: white wins
%     wp_black: win probabilities for black
%     d_white: 4-d matrix of size nx*ny*3*nb2 containing all moves by white
%     w_white: nb2*1, 0: tie, 1: black wins, 2: white wins
%     wp_white: win probabilities for white
%     stat (optional): statistics for net1, stat=[win loss tie], for net2 swap win & loss
% written by Sae-Young Chung
% last update: 2016/04/17
% EE405C Network of Smart Systems, KAIST

np=50
m=np*ng
d=zeros(24,6,3,m,'uint8');
w=zeros(m,1);
valid_data=zeros(m,1);  % 1 means valid data to be used for training
b=zeros(24,6,ng);
state=zeros(0,ng);

game_in_progress=ones(ng,1);

for k=1:np
    b=rotate_cube(b,net,game_in_progress,r,k);
    s=
    idx=(k-1)*ng+1:k*ng;
    d(:,:,1,idx)=(b==1);  % board is frozen if not in progress. thus double entries in 'd' are possible, but ok
    d(:,:,2,idx)=(b==2);
    d(:,:,3,idx)=(b==3);
    d(:,:,4,idx)=(b==4);
    d(:,:,5,idx)=(b==5);
    d(:,:,6,idx)=(b==6);

end

if number_of_games_in_progress>0
    %disp(sprintf('Warning - maximum moves reached in %d games.', number_of_games_in_progress))
end

for k=1:np
    idx=(k-1)*ng+1:k*ng;
    w(idx)=w0;  % final winner
end



if nargout>=6
    fv=find(valid_data.*(turn==1));
    varargout{1}=d(:,:,:,fv);   % include only valid moves by black
    varargout{2}=w(fv);
    varargout{3}=wp(fv);
    fv=find(valid_data.*(turn==2));
    varargout{4}=d(:,:,:,fv);   % include only valid moves by white
    varargout{5}=w(fv);
    varargout{6}=wp(fv);
    if nargout>=7
        varargout{7}=[win loss tie];
    end
elseif nargout>=2
    fv=find(valid_data);
    varargout{1}=d(:,:,:,fv);   % include only valid entries
    varargout{2}=w(fv);
    if nargout>=3
        varargout{3}=wp(fv);
    end
    if nargout>=4
        varargout{4}=[win loss tie];
    end
else
    varargout{1}=[win loss tie];
end