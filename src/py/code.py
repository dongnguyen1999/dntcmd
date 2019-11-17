

insert_list(x, p, L);


   1 4 5 5 5 6 8 9               10
L  p ...                    x<L[p]     


typedef Node* Postion;

Node node; node.next;
Node *p; p->next;

void IncInsert(int x, List &L){
    Position p;
    for (p = L; p->next != null; p = p->next){
        if (x < retrieve(p, L)){
            insert_list(x, p, L);
            break;
        }
    }
    if (p->next == null){// neu loop k break lan nao
        insert_list(x,p,L);
    }
}n nao
        insert_list(x,p,L);

int computeSum(List &L){
    int sum = 0;
    for (p = L; p->next != null; p = p->next){
        sum += retrieve(p, L);
    }
    return sum;
}
   0 1 2 3 4 5 6 7               0 1 2 3
   1 4 5 20 21 25 80 90          1 4 7 9

1 1 4 4 5 7 9 20 21 25 80 90

1 1 4 

List& merge(List& L1, List& L2){
    List L;
    makenull_list(L);
    Position p1 = L1;
    Position p2 = L2;
    Position p = L;//vi tri last  hien tai cua L
    while (p1->next != null && p2->next != null){              
        if (retrieve(p1, L1) < retrieve(p2, L2)){
            insert_list(retrieve(p1, L1), p, L);
            p = p->next;
            p1 = p1->next;
        } else {
            insert_list(retrieve(p2, L2), p, L);
            p = p->next;
            p2 = p2->next;
        }
    }
    while (p1->next != null){//L2 kt trc
       insert_list(retrieve(p1, L1), p, L);
       p = p->next;
       p1 = p1->next;
    }
    while (p2->next != null){//L1 kt trc
        insert_list(retrieve(p2,L2), p, L);
        p = p->next;
        p2 = p2->next;
    }
    //reverse L
    Position current, prev=null, next=null;
    current = L.next;
    while (current != null){
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }
    List rL = (List)malloc(sizeof(Node));
    rL->next = prev;
    return rL;

}


//duyet cay theo muc

void duyetTheoMuc(Tree&  T){
    Queue Q;
    makenull_queue(Q);
    enqueue(T, Q)
    while (!empty_queue(Q)){
        Tree u = front(Q);
        dequeue(Q);
        printf("%d ",u->Data);
        if (leftchild(u) != null) enqueue(leftchild(u), Q);
        if (rightchild(u) != null) enqueue(rightchild(u), Q);
    }
}


0   0
1   1
2   10
3   5
4   6
5   4
6   7
7   emp
8   2
9   8
10   3







