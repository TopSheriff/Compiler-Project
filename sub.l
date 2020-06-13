%{
#include<bits/stdc++.h>
using namespace std;
#include<fcntl.h>
int d;
%}
%%
[0-9][0-9][:][0-9][0-9][:][0-9][0-9] {
    string ss,mm,hh;
    int s,m,h; 
	hh=hh+yytext[0];
	hh=hh+yytext[1];
	mm=mm+yytext[3];
	mm=mm+yytext[4];
	ss=ss+yytext[6];
	ss=ss+yytext[7];
	h=stoi(hh);
	m=stoi(mm);
	s=stoi(ss);

	s=s+d;
	m=m+(s/60);
	h=h+(m/60);
	m=m%60;
	s=s%60;

	fprintf(yyout,"%d:%d:%d",h,m,s);
}
. {	fprintf(yyout,"%s",yytext); }
%%
int main()
{
yyin=fopen("samplesub.srt","r");
yyout=fopen("outputfile.srt","w");
int ch;
while(1)
{
	cout<<"1.Delay\n2.Advance\n3.Exit and save changes\nEnter your choice:";
	cin>>ch;
	switch(ch)
	{
		case 1:
		   cout<<"Enter the delay fix value(in seconds):";
		   cin>>d;
		   yylex();
		   fclose(yyin);
		   break;
		case 2:
		   cout<<"Enter the advance fix value(in seconds):";
		   cin>>d;
		   d=-d;
		   yylex();
		   fclose(yyin);
		   break;
		case 3:
		  exit(0);
	}	
}
return 0;
}


