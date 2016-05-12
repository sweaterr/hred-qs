* A RNN can also be trained to decode a sentence out of a given query encoding. 
* Precisely, it parameterizes a con- ditional probability distribution on the space of possible queries given the input encoding. 
* The process is illustrated in Figure 2 (b). 
* The input encoding may be used as initial- ization of the recurrence. 
* The input encoding은 recurrence의 초기화로 사용될 수있다.
* Then, each of the recurrent states is used to estimate the probability of the next word in the sequence. 
* 각 recurrent states는 문장에서 다음 단어의 확률을 추정하는데 사용된다.
* When a word is sampled, the recurrent state is updated to take into account the generated word.
* 하나의 단어가 sampled 되었을 때, 그 recurrent state 는 생성된 단어를 고려하기 위해 업데이트 된다.
* The pro- cess continues until the end-of-query symbol ◦ is produced.
* 이 과정은 end-of-query symbol ◦ 가 생성될 때까지 계속된다.
* The previous two use cases of RNNs can be pipelined into a single recurrent encoder-decoder
* 이전 두 개의 RNN들은 하나의 recurrent encoder-decoder로 연결될 수 있다.
* , as proposed in [11, 37] for Machine Translation purposes. 
* 기계 번역 논문 [11, 37]에 제안됐듯이.
* The architecture can be used to parameterize a mapping between sequences of words. 
* 이 구조는 단어들의 시퀀스 사이의 mapping을 parameterize하는데 사용될 수 있다.
* This idea can be promptly casted in our framework by pre- dicting the next query in a session given the previous one. 
* 이 아이디어는 이전 단어들이 주어졌을 때, 다음 단어를 예측함으로써, 즉시 우리의 프레임웍에 적용될수 있다.
* With respect to our example, 
* 우리의 예를 보면,
* the query encoding estimated by the RNN in Figure 2 (a) can be used as input to the RNN in Figure 2 (b): 
* 그림 2(a)에서 RNN에 의해서 추정된 쿼리 인코딩은 그림2(b)의 RNN의 입력으로 사용될 수 있다.
* the model learns a mapping between the consecutive queries cleveland gallery and lake erie art. 
* 이 모델은 연속적인 쿼리 사이(cleveland gallery -> lake erie art)의 mapping을 학습한다.
* At test time, the user query is encoded and then decoded into likely continuations that may be used as suggestions.
* 테스트 타임에는 유저쿼리는 인코딩되고 추천에 사용될 수 있는 그럴듯한 다음 단어를 디코딩한다.
