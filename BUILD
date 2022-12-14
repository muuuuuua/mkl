load(
    "@com_github_mkl//:compression.bzl",
    "decompress_xz",
)

package(
    default_visibility = ["//visibility:public"],
)

cc_library(
    name = "_headers",
    hdrs = [
        "include/fftw/fftw.h",
        "include/fftw/fftw3-mpi.h",
        "include/fftw/fftw3-mpi_mkl.h",
        "include/fftw/fftw3.h",
        "include/fftw/fftw3_mkl.h",
        "include/fftw/fftw3_mkl_f77.h",
        "include/fftw/fftw_mpi.h",
        "include/fftw/fftw_threads.h",
        "include/fftw/rfftw.h",
        "include/fftw/rfftw_mpi.h",
        "include/fftw/rfftw_threads.h",
        "include/i_malloc.h",
        "include/mkl.h",
        "include/mkl_blacs.h",
        "include/mkl_blas.h",
        "include/mkl_blas_64.h",
        "include/mkl_blas_omp_offload.h",
        "include/mkl_blas_omp_variant.h",
        "include/mkl_cblas.h",
        "include/mkl_cdft.h",
        "include/mkl_cdft_types.h",
        "include/mkl_cluster_sparse_solver.h",
        "include/mkl_compact.h",
        "include/mkl_df.h",
        "include/mkl_df_defines.h",
        "include/mkl_df_functions.h",
        "include/mkl_df_types.h",
        "include/mkl_dfti.h",
        "include/mkl_dfti_omp_offload.h",
        "include/mkl_direct_blas.h",
        "include/mkl_direct_blas_kernels.h",
        "include/mkl_direct_call.h",
        "include/mkl_direct_lapack.h",
        "include/mkl_direct_types.h",
        "include/mkl_dss.h",
        "include/mkl_graph.h",
        "include/mkl_lapack.h",
        "include/mkl_lapack_omp_offload.h",
        "include/mkl_lapack_omp_variant.h",
        "include/mkl_lapacke.h",
        "include/mkl_omp_offload.h",
        "include/mkl_omp_variant.h",
        "include/mkl_pardiso.h",
        "include/mkl_pblas.h",
        "include/mkl_poisson.h",
        "include/mkl_rci.h",
        "include/mkl_scalapack.h",
        "include/mkl_service.h",
        "include/mkl_solvers_ee.h",
        "include/mkl_sparse_handle.h",
        "include/mkl_sparse_qr.h",
        "include/mkl_spblas.h",
        "include/mkl_spblas_omp_offload.h",
        "include/mkl_spblas_omp_variant.h",
        "include/mkl_trans.h",
        "include/mkl_trans_names.h",
        "include/mkl_trig_transforms.h",
        "include/mkl_types.h",
        "include/mkl_version.h",
        "include/mkl_vml.h",
        "include/mkl_vml_defines.h",
        "include/mkl_vml_functions.h",
        "include/mkl_vml_omp_offload.h",
        "include/mkl_vml_omp_variant.h",
        "include/mkl_vml_types.h",
        "include/mkl_vsl.h",
        "include/mkl_vsl_defines.h",
        "include/mkl_vsl_functions.h",
        "include/mkl_vsl_omp_offload.h",
        "include/mkl_vsl_omp_variant.h",
        "include/mkl_vsl_types.h",
    ],
    strip_include_prefix = "include",
)

cc_library(
    name = "_core",
    srcs = [
        "lib/libmkl_core.a",
    ],
)


cc_library(
    name = "_thread",
    srcs = [
        "lib/libmkl_intel_thread.a",
    ],
    deps = [
        ":_core",
    ],
)


cc_library(
    name = "_ilp64",
    srcs = [
        "lib/libmkl_intel_ilp64.a",
    ],
    deps = [
        ":_core",
        ":_thread",
    ],
)


cc_library(
    name = "_lp64",
    srcs = [
        "lib/libmkl_intel_lp64.a",
    ],
    deps = [
        ":_core",
        ":_thread",
    ],
)

cc_library(
    name = "_sequential",
    srcs = [
        "lib/libmkl_sequential.a",
    ],
    deps = [
      ":_core",
    ],
)


cc_library(
    name = "common",
    deps = [
        ":_headers",
        ":_ilp64",
        ":_lp64",
        ":_sequential",
    ],
)


[
    decompress_xz(
        name = "_decompress-%s" % x[4:-3],
        src = x,
    )
    for x in glob(["lib/*.xz"])
]

