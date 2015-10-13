using PyCall
@pyimport matplotlib.pyplot as plt

srand(0)
include("generate_data.jl")

M = 100
N = 100

# A "blurring" matrix
my_matrix = zeros((M, N))
# Note: Julia uses column-major order
for(j in 1:N)
	for(i in 1:M)
		my_matrix[i, j] = exp(-abs(i - j)/5.0)
	end
end

# A true signal that we want to recover
x = zeros(N)
x[Int(N/2):Int(N/2+5)] = 1.0

# A dataset
y = generate_data(x, my_matrix)

# Do regularised inversion
include("reginv.jl")
x_fit = reginv(y, my_matrix, 1.0)

# Plot the data and the inferred signal using matplotlib
plt.plot(x, "ro-", label="True signal")
plt.plot(y, "bo-", label="Blurred, noisy data")
plt.plot(x_fit, "go-", label="MAP")
plt.legend(loc="upper right")
plt.show()


