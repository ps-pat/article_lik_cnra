using Distributed, Pkg


# ntasks = parse(Int, first(ARGS))

addprocs(exeflags = "--project=../../.",
	 topology = :master_worker)

@everywhere begin
    using Pkg

    Pkg.add("Simulations")
    
    Pkg.instantiate()
    Pkg.precompile()
end

using Simulations

study1(n_is = 5000)

for worker in workers()
    rmprocs(worker)
end
