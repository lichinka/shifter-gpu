#include <stdio.h>
#include <stdlib.h>

#include <mpi.h>

int foo(int rank, int size) {
    int local  = rank;
    int remote = -1;
    int source = (rank+1) % size;
    int target = (rank-1) < 0 ? size-1 : rank-1;

    MPI_Request request;
    MPI_Status status;

    MPI_Irecv(&remote, 1, MPI_INT, source, 0, MPI_COMM_WORLD, &request);
    MPI_Send(&local, 1, MPI_INT, target, 0, MPI_COMM_WORLD);
    MPI_Wait(&request, &status);

    return remote;
}

int main(int argc, char** argv) {
    int rank, mpi_size;
    int result;

    MPI_Init(&argc,&argv); 
    MPI_Comm_size(MPI_COMM_WORLD,&mpi_size);
    MPI_Comm_rank(MPI_COMM_WORLD,&rank);

    result = foo(rank, mpi_size);
    printf("hello world from rank %d of %d with result %d\n", rank, mpi_size, result);

    MPI_Finalize();

    return 0;
}
