

# using Pkg
# Pkg.add("Package Name")
using PhyloNetworks
using PhyloPlots



# data from github


# Consensous tree from one tree selected by gene trees
gt_data = "https://raw.githubusercontent.com/crsl4/PhyloNetworks.jl/master/examples/raxmltrees.tre"
genetrees = readMultiTopology(download(gt_data))
tre = genetrees[3]

# Concordance factors from obtained from the gene trees
cf1 = "https://raw.githubusercontent.com/acosta187/datos/main/tableCF.csv"
raxmlCF = readTableCF(download(cf1))

# Snaq
net0 = snaq!(tre,  raxmlCF, hmax=0, filename="net0_bucky", seed=123,runs=2)
net1 = snaq!(net0, raxmlCF, hmax=1, filename="net1_bucky", seed=456,runs=2)

print(net1)
plot(net1, :R, showGamma=true);




## creando la data 

using PhyloNetworks
using PhyloPlots

# Consensous tree from one tree selected by gene trees
# nano raxmltrees.tre
genetrees = readMultiTopology("raxmltrees.tre")
tre = genetrees[3]

# Concordance factors from obtained from the gene trees
# nano tableCF.csv
raxmlCF = readTableCF("tableCF.csv")
raxmlCF

# Snaq
net0 = snaq!(tre,  raxmlCF, hmax=0, filename="net0_bucky", seed=123,runs=2)
net1 = snaq!(net0, raxmlCF, hmax=1, filename="net1_bucky", seed=456,runs=2)

print(net1)
plot(net1, :R, showGamma=true);


 
 
