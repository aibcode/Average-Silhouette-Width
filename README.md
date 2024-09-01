The code computes the silhouette values based on the silhouette method description of Kaufman and Rousseeuw (1990) and Rousseeuw (1987).

### Algorithm: Average Silhouette Width

**Input:**  
- $\boldsymbol{D}$: a dissimilarity matrix  
- $C$: the clustering partitions

**Output:**  
- Silhouettes $\hat{s}$

1. For each data point $i \in \boldsymbol{D}$:
    1. Compute the average dissimilarity:
        $a_i = \frac{\sum_{j \in C_i, i \neq j} d_{ij}}{n_{c_i}-1}$
    2. Compute the average dissimilarity to the nearest cluster:
        $b_i = \frac{\min_{j \neq i} \sum_{j \in C_j} d_{ij}}{n_{c_j}-1}$
    3. Compute the silhouette:
        $\hat{s}_i = \frac{b_i - a_i}{\max\{a_i, b_i\}}$
2. Compute the average silhouette width for each cluster:
    $\frac{\sum_{i=1}^{n_{c_i}}\hat{s_i}}{n_{c_i}-1}$
3. Compute the overall average silhouette width:
    $\overline{s} = \frac{\sum_{i=1}^{n} \hat{s}_i}{n-1}$



References

Kaufman, L., & Rousseeuw, P. (1990). Finding groups in data: An introduction to cluster analysis. Wiley. Available from: https://www.researchgate.net/publication/220695963 Finding Groups in Data An Introduction To
Cluster Analysis.

Rousseeuw, P. J. (1987). Silhouettes: A graphical aid to the interpretation and validation of cluster analysis. Journal of Computational and Applied Mathematics, 20, 53–65. Available from: https://doi.org/10.1016/0377-0427(87)90125-7
