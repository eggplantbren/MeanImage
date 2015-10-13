@doc """
Generate some data using
y = mat*x + n
where x = vector of interest
mat = some transformation matrix
n = noise
This assumes p(n) ~ iid Normal(0, sigma^2)
""" ->
function generate_data(x::Array{Float64, 1}, mat::Array{Float64, 2}, sigma=1.0)
	@assert length(x) == size(mat)[2]
	return mat*x + sigma*randn(size(mat)[1])
end

