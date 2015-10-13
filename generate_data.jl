# A "blurring" matrix
my_matrix = zeros((100, 100))
for(j in 1:100)
	for(i in 1:100)
		my_matrix[i, j] = exp(-abs(i - j)/5.0)
	end
end

@doc """
Generate some data using
y = M*x + n
where x = vector of interest
M = some transformation matrix
n = noise
This assumes p(n) ~ iid Normal
""" ->
function generate_data(M::Array{Float64, 2}, x::Array{Float64, 1})
	@assert length(x) == size(M)[1]
	return M*x + randn(length(x))
end

