# neural-network-app
A matlab app for vowels image recognition


## general operation of the application


![screenshot of app](https://github.com/treysemedo/neural-network-app/blob/main/appImages/Screenshot_1.jpg)




### The application allows the following operations:

* **Upload Images** -> it will Process and convert the images from the given folder name into a file ready to be used by our main app

* **Upload All dataset Images** -> it will process and convert the images from all the dataset folders into a file ready to be used by our main app

* **Load Network** -> load a already trained network into the app

* **Train Network** -> trains the network with the last images loaded and the **train configuration** input settings

* **Save Network** -> save the current Network 

* **Draw Letter** -> opens a paint aplication where you can draw a letter then save it for latter usage in classify image

* **classify Image** -> choose a image, it will be sent to the Network and simulated to get its classification

* **classify Folder Image** -> it will do the **classify Image** for all the images currently entered in the app

### Train Configuration

* **Hidden layers Function** -> choose the ativation function for the hidden layers

* **Output function** -> choose the activation function for the output unity

* **Train Algorithm** -> choose the neural network train algorithm

* **Hidden Layers** -> specify the number of units per hidden layer, for example if you want 2 hiden layers, one with 10 units and the other with 5, u should input-> 10 5

* **Epochs** -> choose the maximun number of epochs for the network to train 

* **Rácio**
  * **on/off**-> switch to use or not racio distribuition for the neural network
  * **train** **validation** **test**-> combine this 3 in order to setup the network distribuition of work
