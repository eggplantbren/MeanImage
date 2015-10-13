using Optim

# Find the posterior mode
function reginv(y_data::Vector{Float64}, mat::Matrix{Float64}, sigma::Float64=1.0)
	x = ones(size(mat)[1])

	# logprob shorthand that only depends on x
	function badness(x)
		return -logprob(x, y_data, mat, sigma)
	end
	return optimize(badness, x, method=:cg, show_trace=true).minimum
end

function logprob(x::Vector{Float64}, y_data::Vector{Float64}, mat::Matrix{Float64}, sigma::Float64)
	y_model = mat*x
	return -3*sum(x.^2) - 0.5*sum((y_data - y_model).^2/sigma^2)
end

