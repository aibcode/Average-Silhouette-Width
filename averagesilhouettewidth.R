silhouette_computation <- function(gower_mat, clustering_vector){
  silhouette_df <- data.frame("s(i)" = rep(NA, nrow(gower_mat)),
                              "i" = 1:nrow(gower_mat),
                              "clustering" = clustering_vector,
                              "neighbour_cluster" = NA)
  k <- length(unique(clustering_vector))
  for(i in 1:nrow(gower_mat)){
    C_i <- silhouette_df[silhouette_df$clustering == silhouette_df[i, 3] ,]$i
    a_i <- sum(gower_mat[i, C_i[!(C_i) %in% i]])/(length(C_i)-1)
    neighbour_cluster <- order(sapply(1:k, function(k) {sum(gower_mat[i, silhouette_df[silhouette_df$clustering == k,]$i])/length(silhouette_df[silhouette_df$clustering == k,]$i)}))[2]
    C_j <- silhouette_df[silhouette_df$clustering == neighbour_cluster ,]$i
    b_i <- sum(gower_mat[i, C_j])/length(C_j)
    silhouette_df[i, 1] <- (b_i-a_i)/max(a_i, b_i)
    silhouette_df[i, 4] <- neighbour_cluster
  }
  avg_si_cluster <- silhouette_df %>% group_by(clustering) %>% summarise(avg_si = mean(s.i.))
  avg_si_data <- mean(silhouette_df$s.i.)
  return(c(avg_si_cluster, avg_si_data))
}