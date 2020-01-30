#include <stdio.h>

int  main()
{
	FILE *a;
	a=fopen("p1.txt","r");
	while(!feof(a))
		printf("%c",fgetc(a) );
	fclose(a);	
	return 0;
}