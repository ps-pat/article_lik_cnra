if length(ARGS) < 3
    println("ntasks mem_per_cpu time")
    exit()
end

using Distributed, ClusterManagers

ntasks = parse(Int, ARGS[1])
mem_per_cpu = ARGS[2]
time = ARGS[3]

addprocs(SlurmManager(ntasks),
         exeflags = "--project=../../.",
	 topology = :master_worker,
         job_name = "study1",
         account = "def-fabricel",
         mail_user = "fournier.patrick@uqam.ca",
         mail_type = "ALL",
         time = time,
         ntasks = ntasks,
         mem_per_cpu = mem_per_cpu)

@everywhere using Simulations

study1(n_is = 5000)

for worker in workers()
    rmprocs(worker)
end
