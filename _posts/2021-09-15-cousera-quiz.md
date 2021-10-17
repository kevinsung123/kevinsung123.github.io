---  
layout: post  
title: "[AI] Cousera Quiz "  
subtitle: "AI Cousrea Quiz "  
categories: ai
tags: ai cousera quiz
comments: true  
---  



## What does a Loss function do ?
- measures how good the current guess is

## What does the optimizer do?
-  

## What is Convergence?
- The process of getting very close to the correct answer

## What does model.fit do?
- It trains the neural network to fit one set of values to another


## What is a Convolution?
- A technique to isolate features in images

## What is a Pooling?
- A technique to reduce the information in an image while maintaining features

## How do Convolutions improve image recognition?
- They isolate features in images

## After passing a 3x3 filter over a 28x28 image, how big will the output be?
- 26X26

## After max pooling a 26x26 image with a 2x2 filter, how big will the output be?
- 13X13

## Applying Convolutions on top of our Deep neural network will make training:
- It depends on many factors. It might make your training faster or slower, and a poorly designed Convolutional layer may even be less efficient than a plain DNN!

## Using Image Generator, how do you label images?
- It’s based on the directory the image is contained in

## What method on the Image Generator is used to normalize the image?
- rescale

## How did we specify the training size for the images?
- the target_size parameter on the training generator

## When we specify the input_shape to be (300, 300, 3), what does that mean?
- Every Image will be 300x300 pixels, with 3 bytes to define color

## f your training data is close to 1.000 accuracy, but your validation data isn’t, what’s the risk here?
- You’re overfitting on your training data

## Convolutional Neural Networks are better for classifying images like horses and humans because:
- All of the above

## After reducing the size of the images, the training results were different. Why?
- We removed some convolutions to handle the smaller images

## What is the name of the object used to tokenize sentences?
- Tokenizer

## What is the name of the method used to tokenize a list of sentences?
- fit_on_texts(sentences)

## Once you have the corpus tokenized, what’s the method used to encode a list of sentences to use those tokens?
- texts_to_sequences(sentences)

## When initializing the tokenizer, how to you specify a token to use for unknown words?
- oov_token=<Token>

## If you don’t use a token for out of vocabulary words, what happens at encoding?
- The word isn’t encoded, and is skipped in the sequence

## If you have a number of sequences of different lengths, how do you ensure that they are understood when fed into a neural network?
- They’ll get padded to the length of the longest sequence by adding zeros to the beginning of shorter ones

## When padding sequences, if you want the padding to be at the end of the sequence, how do you do it?
- Pass padding=’post’ to pad_sequences when initializing it

## What is the name of the TensorFlow library containing common data that you can use to train and test neural networks?
- Tensorflow Datasets

## How many reviews are there in the IMDB dataset and how are they split?
- 50,000 records, 50/50 train/test split

## How are the labels for the IMDB dataset encoded?
- Reviews encoded as a number 0-1

## What is the purpose of the embedding dimension?
- It is the number of dimensions for the vector representing the word encoding

## When tokenizing a corpus, what does the num_words=n parameter do?
- It specifies the maximum number of words to be tokenized, and picks the most common ‘n’ words

## To use word embeddings in TensorFlow, in a sequential layer, what is the name of the class?
- tf.keras.layers.Embedding

## IMDB Reviews are either positive or negative. What type of loss function should be used in this scenario?
- Binary crossentropy

## When using IMDB Sub Words dataset, our results in classification were poor. Why?

## Why does sequence make a large difference when determining semantics of language?
- Because the order in which words appear dictate their impact on the meaning of the sentence

## How do Recurrent Neural Networks help you understand the impact of sequence on meaning?
- They carry meaning from one cell to the next

## How does an LSTM help understand meaning when words that qualify each other aren’t necessarily beside each other in a sentence?
-  Values from earlier words can be carried to later ones via a cell state

## What keras layer type allows LSTMs to look forward and backward in a sentence?
- Bidirectional

## What’s the output shape of a bidirectional LSTM layer with 64 units?
- (None, 128)

## When stacking LSTMs, how do you instruct an LSTM to feed the next one in the sequence?
-  Ensure that return_sequences is set to True only on units that feed to another LSTM

## If a sentence has 120 tokens in it, and a Conv1D with 128 filters with a Kernal size of 5 is passed over it, what’s the output shape?
- (None, 116, 128)

## What is the name of the method used to tokenize a list of sentences?
- fit_to_text(sentences)

## If a sentence has 120 tokens in it, and a Conv1D with 128 filters with a Kernal size of 5 is passed over it, what’s the output shape?
- (None, 116, 128)

## What is the purpose of the embedding dimension?
-  It is the number of dimensions for the vector representing the word encoding

## IMDB Reviews are either positive or negative. What type of loss function should be used in this scenario?
-  Binary crossentropy

## If you have a number of sequences of different lengths, how do you ensure that they are understood when fed into a neural network?
- Use the pad_sequences object from the tensorflow.keras.preprocessing.sequence namespace

## When predicting words to generate poetry, the more words predicted the more likely it will end up gibberish. Why?
- Because the probability that each word matches an existing phrase goes down the more words you create

## What is a major drawback of word-based training for text generation instead of character-based generation?
- Because there are far more words in a typical corpus than characters, it is much more memory intensive

## 

### 참고
- [medium - Linux tools tips](https://medium.com/james-reads-public-cloud-technology-blog/linux-tools-that-i-learned-10-years-ago-which-i-still-use-every-day-9289f952f169)