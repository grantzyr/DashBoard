
"""
包含的 class:
1. MyArray					自定义ArrayList列表
2. prev_node				创建节点
3. NodeS					单向链表创建节点
4. LinkedList				单向链表
5. NodeD					双向链表创建节点
6. DoubleLinkedList			双向链表
7. MyQueue					队列
"""

# 自定义List
class MyArray(object):
	"""
	1. init(capacity)						初始化
	2. resize()								扩容
	3. insert(index, element)				指定位置插入
	4. remove(index)						指定位置删除
	5. output()								遍历并打印
	"""
	def __init__(self, capacity):
		self.array = [None] * capacity
		self.size = 0

	def resize(self):
		array_new = [None] * len(self.array) * 2
		# 从旧数组转移到新的数组
		for i in range(self.size):
			array_new[i] = self.array[i]
		self.array = array_new

	def insert(self, index, element):
		# 判断访问下标是否超出范围
		if index < 0 or index > self.size:
			raise Exception("Over Range!")
		# 判定是否达到容量上限
		if self.size >= len(self.array):
			self.resize()
		# 从右向左循环，逐个元素向右挪
		for i in range(self.size-1, -1, -1):
			self.array[i+1] = self.array[i]
						
		# 插入值
		self.array[index] = element
		self.size += 1

	def remove(self, index):
		# 判断是否超出范围
		if index <0 or index >= self.size:
			raise Exception("Over Range!")
		# 从左到右，逐个元素向左挪动一位
		for i in range(index, self.size):
			self.array[i] = self.array[i+1]
		self.size -= 1


	def output(self):
		for i in range(self.size):
			print(self.array[i])



# Node for SingleLinkedList
class NodeS(object):
	def __init__(self, data):
		self.data = data
		self.next = None


# 单向链表
class LinkedList(object):
	"""
	1. init()								初始化无node
	2. is_empty()	# return True/False		是否为空链表
	3. get(index) # return node 			根据下标获取节点
	4. get_node(data) # return node			根据节点数据获取节点
	5. get_index(data) # retrun index		根据节点数据获取下标
	6. insert(node, index) 					插入node到指定位置
	7. add(node)							头插入
	8. append(node)							尾插入
	9. update(data, index)					根据节点下标更新节点数据
	9. travel()								遍历并打印所有node
	10. remove(index) # return node 		删除指定位置node
	11. extend(LinkedList)					合并链表
	12. clear()								清空链表
	"""
	def __init__(self):
		""" 初始化无node """	
		self.size = 0
		self.head = None
		self.tail = None

	def is_empty(self):
		""" 判定是否为空链表 """
		return self.head == None

	def get(self, index):
		""" 查找指定位置节点 """	
		if index < 0 or index >= self.size:
			raise Exception("over range!")
		p = self.head
		for i in range(index):
			p = p.next
		return p 

	def get_node(self, data):
		""" 根据节点数据获取节点 """
		p = self.head
		for i in range(self.size):
			if p.data == data:
				return p
			else:
				p = p.next
		print("The data is not in LinkedList!")

	def get_index(self, data):
		""" 根据节点数据获取第一个出现的节点下标 """
		p = self.head
		for i in range(self.size):
			if p.data == data:
				return i
			else:
				p = p.next
		print("The data is not in LinkedList!")

	def insert(self, node, index):
		""" 插入指定位置节点 """
		if index < 0 or index > self.size:
			raise Exception("over range!")

		if self.size == 0:
			# 空链表
			self.head = node
			self.tail = node
		elif index == 0:  
			# 插入头部
			node.next = self.head
			self.head = node
		elif self.size == index:  
			# 插入尾部
			self.tail.next = node
			self.tail = node
		else:  
			# 插入中间
			prev_node = self.get(index-1)
			node.next = prev_node.next
			prev_node.next = node 

		self.size += 1

	def add(self, node):
		""" 头插入 """
		self.insert(node, 0)

	def append(self, node):
		""" 尾插入 """
		self.insert(node,self.size)

	def update(self, data, index):
		""" 根据节点下标更新节点数据 """
		if index <0 or index >= self.size:
			raise Exception("over range!")
		if index == 0:
			self.head.data = data
		elif index == self.size-1:
			self.tail.data = data
		else:
			p = self.head
			for i in range(index):
				p = p.next
			p.data= data

	def travel(self):
		""" 遍历并打印 """
		p = self.head
		if self.size == 0:
			print("No Data!")
		else:
			while (p != None):
				print(p.data)
				p = p.next

	def remove(self, index):
		""" 删除指定节点 """
		if index <0 or index >= self.size:
			raise Exception("over range!")

		# 需要暂存被删除节点进行返回
		if index == 0:  
			# 删除头节点
			removed_node = self.head
			self.head = self.head.next
		elif index == self.size-1:  
			# 删除尾节点
			prev_node = self.get(index-1)
			removed_node = self.tail
			prev_node.next = None
			self.tail = prev_node
		else:
			# 删除中间节点
			prev_node = self.get(index-1)
			next_node = prev_node.next.next
			removed_node = prev_node.next 
			prev_node.next = next_node

		self.size -= 1
		return removed_node

	def extend(self, item):
		""" 合并两个链表 """
		if item.is_empty():
			raise Exception("LinkedList is empty!")

		self.tail.next = item.head
		self.tail = item.tail
		self.size += item.size

	def clear(self):
		""" 清空链表 """
		self.head = None 
		self.tail = None
		self.size = 0



# Node for DoubleLinkedList
class NodeD(object):
	def __init__(self, data):
		self.data = data
		self.next = None
		self.prev = None


# 双向链表
class DoubleLinkedList(object):
	"""
	1. init()								初始化无node
	2. is_empty()	# return True/False		是否为空链表
	3. get(index) # return node 			根据下标获取节点
	4. get_node(data) # return node			根据节点数据获取节点
	5. get_index(data) # retrun index		根据节点数据获取下标
	6. insert(node, index) 					插入node到指定位置
	7. add(node)							头插入
	8. append(node)							尾插入
	9. update(data, index)					根据节点下标更新节点数据
	9. travel()								遍历并打印所有node
	10. remove(index) # return node 		删除指定位置node
	11. extend(LinkedList)					合并链表
	12. clear()								清空链表
	"""
	def __init__(self):
		""" 初始化无node """	
		self.size = 0
		self.head = None
		self.tail = None

	def is_empty(self):
		return self.head == None

	def get(self, index):
		""" 根据下标获取节点 """	
		if index < 0 or index >= self.size:
			raise Exception("over range!")
		p = self.head
		for i in range(index):
			p = p.next
		return p 

	def get_node(self, data):
		""" 根据节点数据获取节点 """
		p = self.head
		for i in range(self.size):
			if p.data == data:
				return p
			else:
				p = p.next
		print("The data is not in LinkedList!")

	def get_index(self, data):
		""" 根据节点数据获取第一个出现的节点下标 """
		p = self.head
		for i in range(self.size):
			if p.data == data:
				return i
			else:
				p = p.next
		print("The data is not in LinkedList!")

	def insert(self, node, index):
		""" 插入指定位置节点 """
		if index < 0 or index > self.size:
			raise Exception("over range!")

		if self.size == 0:
			# 空链表
			self.head = node
			self.tail = node
		elif index == 0:  
			# 插入头部
			node.next = self.head
			self.head.prev = node
			self.head = node
		elif self.size == index:  
			# 插入尾部
			self.tail.next = node
			node.prev = self.tail
			self.tail = node
		else:  
			# 插入中间
			prev_node = self.get(index-1)
			node.next = prev_node.next
			node.prev = prev_node
			prev_node.next = node 

		self.size += 1

	def add(self, node):
		""" 头插入 """
		self.insert(node, 0)

	def append(self, node):
		""" 尾插入 """
		self.insert(node,self.size)

	def update(self, data, index):
		""" 根据节点下标更新节点数据 """
		if index <0 or index >= self.size:
			raise Exception("over range!")
		if index == 0:
			self.head.data = data
		elif index == self.size-1:
			self.tail.data = data
		else:
			p = self.head
			for i in range(index):
				p = p.next
			p.data= data

	def travel(self):
		# 遍历并打印所有node
		p = self.head
		if self.size == 0:
			print("No Data!")
		else:
			while (p != None):
				print(p.data)
				p = p.next

	def remove(self, index):
		if index <0 or index >= self.size:
			raise Exception("over range!")

		# 需要暂存被删除节点进行返回
		if index == 0:  
			# 删除头节点
			removed_node = self.head
			self.head = self.head.next
			if self.size != 1:
				self.head.prev = None
		elif index == self.size-1:  
			# 删除尾节点
			removed_node = self.tail
			self.tail = self.tail.prev 
			self.tail.next = None
		else:
			# 删除中间节点
			removed_node = self.get(index)
			prev_node = removed_node.prev 
			next_node = removed_node.next 
			prev_node.next = next_node
			next_node.prev = prev_node

		self.size -= 1
		return removed_node

	def extend(self, item):
		""" 链接两个链表 """
		if item.is_empty():
			raise Exception("LinkedList is empty!")

		self.tail.next = item.head
		item.head.prev = self.tail
		self.tail = item.tail
		self.size += item.size

	def reverse(self):
		""" 链表翻转 """
		p = self.head
		l = None 
		for i in range(self.size):
			l = p
			p = p.next 
			tmp = l.prev
			l.prev = l.next 
			l.next = tmp
		tmp = self.head
		self.head = self.tail
		self.tail = tmp

	def clear(self):
		""" 清空链表 """
		self.head = None 
		self.tail = None
		self.size = 0

class MyQueue(object):
	def __init__(self, capacity):
		self.list = [None] * capacity
		self.front = 0
		self.rear = 0

	def enqueue(self, element):
		if(self.rear+1) % len(self.list) == self.front:
			raise Exception("队列已满！")
		self.list[self.rear] = element
		self.rear = (self.rear+1) % len(self.list)

	def dequeue(self):
		if self.rear == self.rear == self.front:
			raise Exception("队列已满！")
		dequeue_element = self.list[self.front]
		self.front = (self.front+1) % len(self.list)
		return dequeue_element

	def output(self):
		i = self.front
		while i != self.rear:
			print(self.list[i])
			i = (i+1) % len(self.list)

