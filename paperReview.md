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


* Although powerful, such mapping is pairwise, and as a result, most of the query context is lost. 
* 비록 강력하지만, 이러한 mapping은 pairwise이다. 그리고 그 결과, 대부분의 쿼리 context를 잃는다.
* To condition the prediction of the next query on the previous queries in the session, we deploy an additional, session-level RNN on top of the query-level RNN encoder, thus forming a hierarchy of RNNs (Figure 3). 
* 세션에서 이전 쿼리들을 보고 다음 쿼리를 예측하기 위해, 추가적인 세션-레벨 RNN을 쿼리-레벨 RNN위에 배치한다. 그래서 RNN의 계층이 만들어진다.
* The query-level RNN is responsible to  encode a query. 
* 쿼리-레벨 RNN은 쿼리를 인코딩을 책임진다.
* The session-level RNN takes as input the query encoding and updates its own recurrent state. 
* 세션-레벨 RNN은 쿼리 인코딩을 입력받아서 자신의 recurrent state를 업데이트한다.
* At a given position in the session, the session-level recurrent state is a learnt summary of the past queries, keeping the informa- tion that is relevant to predict the next one. 
* 세션에서 주어진 위치에서, session-level recurrent state은 다음 쿼리를 예측하기 위해 연관된 정보를 저장하면서, 과거 쿼리의 요약을 학습한다. 
At this point, the decoder RNN takes as input the session-level recurrent state, thus making the next query prediction contextual.
* 이 때, 디코더 RNN은 session-level recurrent state을 입력받아서, 다음 쿼리 예측을 문맥에 맞게 한다.* 

* The contribution of this architecture is two-fold. 
* 이 구조가 공헌하는 점은 두 개이다.
* The query-level encoder RNN maps similar queries to vectors close in the embedding space (Figure 1 (b)).
* 쿼리-레벨 인코더 RNN은 비슷한 쿼리들을 임베딩 공간에 가깝게 mapping 시킨다.
* The mapping generalizes to queries that have not been seen in the training data, as long as their words appear in the model vocabulary. 
* 이 mapping은 training data에 없는 쿼리들을 일반화한다.  단 쿼리의 단어가 모델 vocabulary 에 존재해야 한다.
* This allows the model to map rare queries to more useful and general formulations, well beyond past co-occurred queries. 
* 이는 모델이 흔하지 않은 쿼리를 좀더 유용하고 일반적인 형태로 매핑할수 있게 해준다. 이는 과거에 같이 등장한 쿼리를 휠씬 넘는다(과거 등장한 쿼리보다 더 좋다 ? 많다?).
* The session-level RNN models the sequence of the previous queries, thus making the prediction of the next query con- textual. 
* 세션-레벨 RNN은 이전 쿼리들의 시퀀스를 모델링하는데, 그래서 다음 쿼리를 예측할 수 있다.
* Similar contexts are mapped close to each other in the vector space. 
* 비슷한 문맥들은 벡터 공간의 가까이 매핑된다.
* This property allows to avoid sparsity, and differently from count-based models [10, 14], to account for contexts of arbitrary length.
* 이 성질은 sparsity를 피하게 해주고, 카운팅-기반 모델과 다르게, 임의 길이의 문맥을 고려할 수 있다.
