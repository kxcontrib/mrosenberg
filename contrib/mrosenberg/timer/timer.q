/timer.q
\d .t

add:{.z.z+x*1%86400}

S:()
T:0#0Nz
A:{[t;s] @[`.t;`T`S;{(x#y),(enlist z),x _ y}[1+T bin t+1%86400];(t;s)];}

.z.ts:{while[not .z.z<first .t.T,.z.z+40000;.t.Z:first .t.S;@[`.t;`T`S;1 _];value .t.Z]}

\t 1000

\
examples:
f:{-1 (string x)," : ",string .z.z;}
.t.add[20 30 10] .t.A'("f[2]";"f[3]";"f[1]");

for repeating timers, have your executable
reschedule an A timer:

f:{.t.A[.t.add[10];"f[]"];work[];} /swap order?
f[] /intial run and schedule next
