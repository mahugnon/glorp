Extension { #name : #ElementBuilder }

{ #category : #'*Glorp' }
ElementBuilder class >> basicClassFor: anExpression in: aQuery [

	^(anExpression hasDescriptor and: [anExpression mapsSimpleObject not])
		ifTrue: [ObjectBuilder] 
		ifFalse: [DataElementBuilder].
]

{ #category : #'*Glorp' }
ElementBuilder class >> classFor: anExpression in: aQuery [
	
	((aQuery returnsDictionary and: [anExpression == aQuery baseExpression])
		or: [anExpression returnsDictionary])
			ifTrue: [^DictionaryBuilder].
	^self basicClassFor: anExpression in: aQuery.
]
