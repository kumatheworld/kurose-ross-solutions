import matplotlib.pyplot as plt
import numpy as np


def main():
    x = np.logspace(np.log10(10), np.log10(1000), 100)
    y = np.linspace(0.3, 2.0, 100)
    X, Y = np.meshgrid(x, y)

    coef = 20_000 / (60 * 60 * 24)
    Z1 = coef * np.maximum(0.5, X / 30)
    Z2 = coef * np.maximum(0.5, X / (30 + X * Y))

    fig = plt.figure()

    ax = fig.add_subplot(111, projection="3d")
    ax.set_zlim(0, 1)
    ax.plot_surface(X, Y, Z1, label="Client-Server")
    ax.plot_surface(X, Y, Z2, label="P2P")
    ax.legend()

    ax.set_xlabel("N")
    ax.set_ylabel("u [Mbps]")
    ax.set_zlabel("Minimum distribution time [days]")

    plt.show()


if __name__ == "__main__":
    main()
