df=read.csv('tes_sten.kimura.txt',sep = ' ')

head(df)

tail(df)

print(nrow(df)) # number of rows
print(ncol(df)) # number of columns
print(dim(df)) # dimensions
print(length(df$Academ)) # use for vectors

# get column names
names(df)

# get column names
colnames(df)

# get row names (index)
rownames(df)

# Remove columns containing at least on null (NA) value
head(df[ , colSums(is.na(df)) == 0])

# Remove last column
head(df[,-ncol(df)])

# Remove specific columns using which() and names()
head(df[,-which(names(df) %in% c('rRNA','tRNA','X'))])

# Remove columns using names()
head(df[,!names(df) %in% c('rRNA','tRNA','X')]) # can also use colnames()

# Removing column using subset
head(subset(df,select = -X))

# Removing multiple columns using subset
df_sub = subset(df,select = -c(tRNA,rRNA,X,Transposable))
head(df_sub)

# Select specifiv rows
df_sub[c(3,5),]

# Select specific columns
head(df_sub[,c(3,5)])

# Select specific columns by name
head(df_sub[,c('BEL','Copia')])

# Create dataframe copy
df02 <- data.frame(df) # can also use df02 <- cbind(df)
head(df02)

# Create column with sum of all values
df_sub02 = cbind(df_sub)
df_sub02[,'totais']=rowSums(df_sub02)
head(df_sub02)

# or Create column with sum of all values
df_sub03 = cbind(df_sub)
df_sub03$totais=rowSums(df_sub03)
head(df_sub03)

# Add row with sum of all values in column
# df_sub03[nrow(df_sub03)+1,]=colSums(df_sub03)
df_sub03['totais',]=colSums(df_sub03)
tail(df_sub03)

# Create dataframe
df_criado = data.frame(foo=c(32,45,56,12),bar=c(65,23,64,98))
df_criado

# Give name to rows
df_criado02 = data.frame(foo=c(32L,45L,56L,12L), # add L to specify number as integer
                         bar=c(65,23,64,98),
                         row.names = c('l1','l2','l3','l4'))
df_criado02
