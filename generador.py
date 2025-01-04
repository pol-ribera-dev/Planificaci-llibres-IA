import random
import networkx as nx
import matplotlib.pyplot as plt
import time
import sys

# El programa ha de tenir input nombre de llibres i dependencies

def generate_book(n):
    book_name = f"l{n}"
    num_pages = round(random.normalvariate(350, 200))
    num_pages = max(1, min(num_pages, 800))
    return (book_name, num_pages)

def create_DAG(N, prob):
    G = nx.DiGraph()
    books = [generate_book(i) for i in range(1,N+1)]

    for book in books:
        G.add_node(book[0], pages=book[1], depth=N*N)

    for i in range(N):
        for j in range(i+1, N):
            if random.randint(1,prob) == 1:
                G.add_edge(books[i][0], books[j][0])


    for node in nx.topological_sort(G):
        if G.in_degree(node) == 0:
            G.nodes[node]['depth'] = 0
        else:
            G.nodes[node]['depth'] = min(G.nodes[pred]['depth'] for pred in G.predecessors(node)) + 1

    return G

def select_llegits(dag):
    nodes_pare = [n for n in dag.nodes if len(list(dag.predecessors(n))) == 0]
    candidats = set(nodes_pare)

    x = len(nodes_pare)
    if (x/2 == x):
        return nodes_pare

    return random.sample(nodes_pare, random.randint(int(x/2),x))

def generate_pddl_content(dag, N, prob):
    pddl_content = []

    pddl_content.append("(define (problem planifiacació)")
    pddl_content.append("  (:domain llibres_en_la_planificació)")

    pddl_content.append("  (:objects")
    pddl_content.append("    " + " ".join(f"l{n+1}" for n in range(N)) + " - llibre")
    pddl_content.append("    " + " ".join(f"m{n}" for n in range(12+1)) + " - mes")
    pddl_content.append("  )\n")


    books_not_to_read = select_llegits(dag)
    books_to_read = list(set(dag.nodes) - set (books_not_to_read))


    pddl_content.append("  (:init")

    for book, attr in dag.nodes(data=True):
        pddl_content.append(f"    (= (paginasl {book}) {attr['pages']})")
    pddl_content.append("")

    pddl_content.append(f"    (= (paginas m0) 800)")
    for i in range(1,12+1):
        pddl_content.append(f"    (= (paginas m{i}) 0)")
    pddl_content.append("")

    for u, v in dag.edges():
        pddl_content.append(f"    (es_predecesor_de {u} {v})")
    pddl_content.append("")

    for book in books_to_read:
        pddl_content.append(f"    (vol_llegir {book})")
    pddl_content.append("")

    for book in books_not_to_read:
        pddl_content.append(f"    (llegit {book} m0)")
    pddl_content.append("")

    nodes = list(dag.nodes(data=True))
    for i in range(len(nodes)):
        for j in range(i + 1, len(nodes)):
            if (nodes[i][1]['depth'] == nodes[j][1]['depth']) and random.randint(1,prob) == 1:
                pddl_content.append(f"    (son_paralels {nodes[i][0]} {nodes[j][0]})")        
    pddl_content.append("")

    for i in range(12+1):
        for j in range(i+1, 12+1):
            pddl_content.append(f"    (es_anterior m{i} m{j})")
        pddl_content.append("")
        
        if (i != 0): pddl_content.append(f"    (permet_paralel m{i} m{i-1})")      
        pddl_content.append(f"    (permet_paralel m{i} m{i})")
        if (i != 12): pddl_content.append(f"    (permet_paralel m{i} m{i+1})")

        pddl_content.append("")



    pddl_content.append("  )")

    pddl_content.append("  (:goal")
    pddl_content.append("    (forall (?l - llibre) (not (vol_llegir ?l)))")
    pddl_content.append("  )")
    pddl_content.append(")")

    return pddl_content
    


seed = int(time.time())
print(f"Semilla utilizada: {seed}")
#random.seed(seed)
random.seed(1704235599)

#N = llibres en total / D = Si es 1 hi ha un 100% de probabilitats d'afegir dependències i paralelismes, si es 2 un 50%, 4 un 25%, etc...
# Obtener argumentos de línea de comandos

if len(sys.argv) != 3:
    print("Error: Se esperan exactamente dos parámetros.")
    sys.exit(1)

# Convertir argumentos a los tipos de datos adecuados
N = int(sys.argv[1])  # Número de libros
D = float(sys.argv[2])  # Probabilidad

dag = create_DAG(N,D)
dag_data = generate_pddl_content(dag, N, D)

with open('data.pddl', 'w') as file:
    for line in dag_data:
        file.write(line + '\n')


"""
# Visualitzar DAG
plt.figure(figsize=(10, 6))
pos = nx.spring_layout(dag)
nx.draw(dag, pos, with_labels=True, node_color='lightblue', edge_color='gray', node_size=2000)
node_labels = nx.get_node_attributes(dag, 'pages')
nx.draw_networkx_labels(dag, pos, labels=node_labels)
plt.title("Generated DAG with Book Nodes")
plt.show()
"""
