f[n_] := (
	If[Length@{##} == 1,
		"g" <> StringJoin @@ Table["o", {n}] <> First@{##},
		f[n + 1]]
	) &;
g[x_] := f[0][x];
g[] := f[1];

(* Test *)

g["al"]
g[][]["al"]
g[][][][][][][][][]["al"]
