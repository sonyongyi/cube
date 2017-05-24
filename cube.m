a=ones(3,3,6);
for k=1:6
    a(:,:,k)=k*a(:,:,k);
end
face=[1 2 13 12;12 13 16 11;11 16 9 10; 2 3 14 13; 13 14 15 16; 16 15 8 9; 3 4 5 14 ;14 5 6 15;15 6 7 8];
% Up
vertex1=[0 0 3;1 0 3;2 0 3;3 0 3;3 1 3;3 2 3; 3 3 3; 2 3 3; 1 3 3; 0 3 3;0 2 3; 0 1 3; 1 1 3; 2 1 3; 2 2 3; 1 2 3];
lc1=[1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;1 0 0;];
patch('Faces',face,'Vertices',vertex1,'FaceVertexCData',lc1,'FaceColor','flat');

% Front
vertex2=[3 0 0; 2 0 0; 1 0 0; 0 0 0;0 1 0;0 2 0;0 3 0;1 3 0;2 3 0; 3 3 0; 3 2 0; 3 1 0;2 1 0; 1 1 0; 1 2 0; 2 2 0];
lc2=[0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;];
patch('Faces',face,'Vertices',vertex2,'FaceVertexCData',lc5,'FaceColor','flat');

% Right
vertex3=[3 0 0; 2 0 0; 1 0 0; 0 0 0;0 1 0;0 2 0;0 3 0;1 3 0;2 3 0; 3 3 0; 3 2 0; 3 1 0;2 1 0; 1 1 0; 1 2 0; 2 2 0];
lc3=[];
patch('Faces',face,'Vertices',vertex2,'FaceVertexCData',lc3,'FaceColor','flat');

% Left
vertex4=[3 0 0; 2 0 0; 1 0 0; 0 0 0;0 1 0;0 2 0;0 3 0;1 3 0;2 3 0; 3 3 0; 3 2 0; 3 1 0;2 1 0; 1 1 0; 1 2 0; 2 2 0];
lc4=[0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;];
patch('Faces',face,'Vertices',vertex2,'FaceVertexCData',lc4,'FaceColor','flat');



% Back
vertex6=[3 0 0; 2 0 0; 1 0 0; 0 0 0;0 1 0;0 2 0;0 3 0;1 3 0;2 3 0; 3 3 0; 3 2 0; 3 1 0;2 1 0; 1 1 0; 1 2 0; 2 2 0];
lc6=[0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;];
patch('Faces',face,'Vertices',vertex2,'FaceVertexCData',lc6,'FaceColor','flat');

% Down
vertex6=[3 0 0; 2 0 0; 1 0 0; 0 0 0;0 1 0;0 2 0;0 3 0;1 3 0;2 3 0; 3 3 0; 3 2 0; 3 1 0;2 1 0; 1 1 0; 1 2 0; 2 2 0];
lc6=[0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;];
patch('Faces',face,'Vertices',vertex6,'FaceVertexCData',lc6,'FaceColor','flat');

view(3)
grid on
axis([0 3 0 3 0 3])
% while 1
%     patch('Faces',face,'Vertices',vertex,'FaceColor',[1 1 1]);
%     drawnow()
% end