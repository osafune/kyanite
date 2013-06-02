/* ファイルシステムテスト */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/stat.h>

#include <system.h>
#include <io.h>
#include <alt_types.h>
#include <sys/alt_cache.h>

#include "mmcfs/mmcfs.h"
#include "nd_lib/nd_egl.h"


void nd_halt(void)
{
	while(1) {}
}


int main(void)
{
	FILE *fp;
	int i,c,byte;
	alt_u16 *pFrameBuffer;

	// システム初期化 

	nd_GsVgaInit();

	i = mmcfs_setup();
	printf("mmcfs_setup value = %d\n",i);

	for(i=0,c=0 ; i<10 ; i++) {
		c = (c << 1) | 1;
		IOWR(LED_BASE, 0, c);
		usleep(200000);
	}


	// 画像を展開 

//	pFrameBuffer = (alt_u16 *)alt_uncached_malloc(1024*480*2);
	pFrameBuffer = (alt_u16 *)malloc(1024*480*2);
	if (pFrameBuffer != na_null) {
		printf("Framebuffer assignment = 0x%08X\n",(unsigned int)pFrameBuffer);

		nd_GsVgaSetBuffer((nd_u32)pFrameBuffer);
        nd_GsEglPage((nd_u32)pFrameBuffer,(nd_u32)pFrameBuffer,0);

		nd_GsVgaScanOn();

		nd_color(nd_COLORWHITE, 0, 256);
		nd_boxfill(0, 0, window_xmax, window_ymax);

        nd_color(nd_COLORWHITE, 0, 256);
		nd_line(0,0, 0,479);
        nd_color(nd_COLORRED, 0, 256);
		nd_line(639,0, 639,479);
        nd_color(nd_COLORLIGHTGREEN, 0, 256);
		nd_line(0,0, 639,0);
        nd_color(nd_COLORBLUE, 0, 256);
		nd_line(0,479, 639,479);

		if((fp = fopen("mmcfs:/de0/test_vga.bin","rb"))!= NULL) {
			fread(pFrameBuffer, 1, 1024*480*2, fp);
			fclose(fp);

			alt_dcache_flush(pFrameBuffer, 1024*480*2);
		} else {
			printf("[!] File not found.\n");
		}

//		nd_GsVgaScanOn();
	} else {
		printf("[!] Framebuffer not assignment.\n");
	}


	// ワークエリアを開放する

//	alt_uncached_free(pFrameBuffer);
	free(pFrameBuffer);


	// 終了 

	printf("done.\n");
    nd_halt();
}
