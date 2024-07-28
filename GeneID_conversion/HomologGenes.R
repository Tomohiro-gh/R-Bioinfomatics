
# CellCycleScoring() function
#   https://satijalab.org/seurat/articles/cell_cycle_vignette.html

# Cell cycle scoring
# Seuratをloadすると読み込まれる
cc.genes
# $s.genes
# [1] "MCM5"     "PCNA"     "TYMS"     "FEN1"     "MCM2"     "MCM4"     "RRM1"    
# [8] "UNG"      "GINS2"    "MCM6"     "CDCA7"    "DTL"      "PRIM1"    "UHRF1"   
# [15] "MLF1IP"   "HELLS"    "RFC2"     "RPA2"     "NASP"     "RAD51AP1" "GMNN"    
# [22] "WDR76"    "SLBP"     "CCNE2"    "UBR7"     "POLD3"    "MSH2"     "ATAD2"   
# [29] "RAD51"    "RRM2"     "CDC45"    "CDC6"     "EXO1"     "TIPIN"    "DSCC1"   
# [36] "BLM"      "CASP8AP2" "USP1"     "CLSPN"    "POLA1"    "CHAF1B"   "BRIP1"   
# [43] "E2F8"    

# $g2m.genes
# [1] "HMGB2"   "CDK1"    "NUSAP1"  "UBE2C"   "BIRC5"   "TPX2"    "TOP2A"   "NDC80"  
# [9] "CKS2"    "NUF2"    "CKS1B"   "MKI67"   "TMPO"    "CENPF"   "TACC3"   "FAM64A" 
# [17] "SMC4"    "CCNB2"   "CKAP2L"  "CKAP2"   "AURKB"   "BUB1"    "KIF11"   "ANP32E" 
# [25] "TUBB4B"  "GTSE1"   "KIF20B"  "HJURP"   "CDCA3"   "HN1"     "CDC20"   "TTK"    
# [33] "CDC25C"  "KIF2C"   "RANGAP1" "NCAPD2"  "DLGAP5"  "CDCA2"   "CDCA8"   "ECT2"   
# [41] "KIF23"   "HMMR"    "AURKA"   "PSRC1"   "ANLN"    "LBR"     "CKAP5"   "CENPE"  
# [49] "CTCF"    "NEK2"    "G2E3"    "GAS2L3"  "CBX5"    "CENPA"  
s.genes <- cc.genes$s.genes
g2m.genes <- cc.genes$g2m.genes








library(biomaRt)
listMarts()
#biomart                version
#1 ENSEMBL_MART_ENSEMBL      Ensembl Genes 105
#2   ENSEMBL_MART_MOUSE      Mouse strains 105
#3     ENSEMBL_MART_SNP  Ensembl Variation 105
#4 ENSEMBL_MART_FUNCGEN Ensembl Regulation 105
ensembl = useMart("ensembl")
listDatasets(ensembl)
attributePages(ensembl)
# [1] "feature_page" "structure"    "homologs"     "snp"          "sequences"
listMarts(host="asia.ensembl.org")



# Zebrafishのdatasetを作成
dr = useMart("ENSEMBL_MART_ENSEMBL", "drerio_gene_ensembl", host="asia.ensembl.org")

# getBMのattributeに入れる変数の一覧を取得する
listAttributes(dr)
  la <- as.data.frame(listAttributes(dr))
  write.xlsx(la, "BiomaRt_ensembl_zf_listAttributes.xlsx", rowNames=F)

# zebrafish ensembl idを元に,対応するhuman geneを idとsymbolで対応させたdfを作成
dr2hsa <- getBM(attributes = c("ensembl_gene_id",
                               "external_gene_name",
                               "hsapiens_homolog_ensembl_gene",
                               "hsapiens_homolog_associated_gene_name"),
                filters = "", 
                values = "",
                uniqueRows=TRUE,
                mart = dr)
write.xlsx(as.data.frame(dr2hsa), "BiomaRt_ensembl_zf_hsa_ortholog_list.xlsx", rowNames=F)











library(babelgene)
# Ortholog conversion to zebrafish
# https://cran.r-project.org/web/packages/babelgene/vignettes/babelgene-intro.html

# 対応している種は speciesコマンドで
species()
> species()
taxon_id                 scientific_name                                                    common_name
1     28377             Anolis carolinensis                                    Carolina anole, green anole
2      9913                      Bos taurus  bovine, cattle, cow, dairy cow, domestic cattle, domestic cow
3      6239          Caenorhabditis elegans                                                      roundworm
4      9615          Canis lupus familiaris                                                      dog, dogs
5      7955                     Danio rerio              leopard danio, zebra danio, zebra fish, zebrafish
6      7227         Drosophila melanogaster                                                      fruit fly
7      9796                  Equus caballus                                  domestic horse, equine, horse
8      9685                     Felis catus                                        cat, cats, domestic cat
9      9031                   Gallus gallus                   bantam, chicken, chickens, Gallus domesticus
10     9544                  Macaca mulatta rhesus macaque, rhesus macaques, Rhesus monkey, rhesus monkeys
11    13616           Monodelphis domestica                                      gray short-tailed opossum
12    10090                    Mus musculus                                             house mouse, mouse
13     9258        Ornithorhynchus anatinus              duck-billed platypus, duckbill platypus, platypus
14     9598                 Pan troglodytes                                                     chimpanzee
15    10116               Rattus norvegicus                               brown rat, Norway rat, rat, rats
16     4932        Saccharomyces cerevisiae                   baker's yeast, brewer's yeast, S. cerevisiae
17   284812 Schizosaccharomyces pombe 972h-                                                           <NA>
  18     9823                      Sus scrofa                                    pig, pigs, swine, wild boar
19     8364              Xenopus tropicalis                      tropical clawed frog, western clawed frog
# Input genes are assumed to be human by default. You can specify if the input genes are human with the human parameter.
s.genes.zf <- orthologs(genes = s.genes, species = "zebrafish")
g2m.genes.zf <- orthologs(genes = g2m.genes, species = "zebrafish")

orthologs(genes = "KLF2", species = "zebrafish")




library(homologene) 
homologene::taxData
tax_id                      name_txt
1   10090                  Mus musculus
2   10116             Rattus norvegicus
3   28985          Kluyveromyces lactis
4  318829            Magnaporthe oryzae
5   33169         Eremothecium gossypii
6    3702          Arabidopsis thaliana
7    4530                  Oryza sativa
8    4896     Schizosaccharomyces pombe
9    4932      Saccharomyces cerevisiae
10   5141             Neurospora crassa
11   6239        Caenorhabditis elegans
12   7165             Anopheles gambiae
13   7227       Drosophila melanogaster
14   7955                   Danio rerio
15   8364 Xenopus (Silurana) tropicalis
16   9031                 Gallus gallus
17   9544                Macaca mulatta
18   9598               Pan troglodytes
19   9606                  Homo sapiens
20   9615        Canis lupus familiaris
21   9913                    Bos taurus

homologene("VEGFA", inTax = 9606, outTax = 7955)
# 1 VEGFA vegfab    7422  558154
# ortholog1つしか出てこない
# tax_idのリスト
homologene("PDGFB", inTax = 9606, outTax = 7955)
homologene("PDGFRB", inTax = 9606, outTax = 7955)
homologene("vegfaa", inTax = 7955, outTax = 9606)
homologene("vegfab", inTax = 7955, outTax = 9606)
homologene("p2rx8", inTax = 7955, outTax = 9606)



library(readr)
library(magrittr)
library(dplyr)
dir.create('homologene-files',showWarnings = FALSE)
download.file(url = "ftp://ftp.ncbi.nih.gov/pub/HomoloGene/current/homologene.data", 
              destfile = 'homologene-files/homologene.data')
homologene = read_tsv('homologene-files/homologene.data',
                      col_names = c('HID',
                                    'Taxonomy',
                                    'Gene.ID',
                                    'Gene.Symbol',
                                    'Protein.GI',
                                    'Protein.Accession'))



