//#include <conio.h> 
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h> 
int  main()
{
	mkdir("co_Fio");
	FILE *a;
	a=fopen("co_Fio/p2.txt","w");
	char x;
	while ((x=getchar())!=EOF)
		putc(x,a);
	fclose(a);
	FILE *b;
	b=fopen("co_Fio/p2.txt","r");
	while(!feof(b))
		printf("%c",fgetc(b) );
	fclose(b);

	return 0;

}