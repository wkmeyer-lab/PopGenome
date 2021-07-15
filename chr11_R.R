#set a value because I was getting this error
#Error: unexpected symbol in "CHR11 <- FADS1-3.HC3202_chr11.60799627"
CHR11 <- "FADS1-3.HC3202_chr11.60799627-62891545.vcf.gz"

GENOME.class <- readVCF(CHR11,numcols=1000,tid="chr11",frompos=60799627,topos=62891545,approx=FALSE,out="",parallel=FALSE,gffpath=FALSE)
#vcff::open : file opened, contains 3202 samples
#[1] "Available ContigIdentifiers (parameter tid):"
#[1] "chr11"
#(!!) whop_tabix::getFieldPtr : requested field 1685 but only 1684 present!
#VCF_readIntoCodeMatrix ::  Problem with reading sample's data!
#	debug info : per_row =1676
#wanted_sample[per_row]=1685
#	baseindex=9, field = 1694
#	numparsedfields=1684
#|            :            |            :            | 100 %
#|====================================================
#
#Concatenate regions 
#|            :            |            :            | 100 %

GENOME.class <- neutrality.stats(GENOME.class,FAST=TRUE)
#|            :            |            :            | 100 %
#|====================================================

get.neutrality(GENOME.class)[[1]]
#                     Tajima.D n.segregating.sites Rozas.R_2   Fu.Li.F   Fu.Li.D Fu.F_S Fay.Wu.H Zeng.E Strobeck.S
#60799627 - 62891545 -1.849302                2720        NA -6.716753 -16.21584     NA      NaN    NaN         NA

GENOME.class@Tajima.D
#         pop 1
#[1,] -1.849302
