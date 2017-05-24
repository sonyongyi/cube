function result=rotate_CF(a)
temp=a;
a(:,:,2)=rot90(temp(:,:,2));
a(:,3,5)=temp(3,:,1);
a(1,:,6)=temp(:,3,5);
a(:,1,3)=temp(1,:,6);
a(3,:,1)=temp(:,1,3);
result=a;
end